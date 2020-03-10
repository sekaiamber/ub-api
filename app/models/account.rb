# == Schema Information
#
# Table name: accounts
#
#  id                              :integer          not null, primary key
#  user_id                         :integer
#  balance                         :decimal(36, 18)  default(0.0)
#  locked                          :decimal(36, 18)  default(0.0)
#  in                              :decimal(36, 18)
#  out                             :decimal(36, 18)
#  default_withdraw_fund_source_id :integer
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  account_type                    :integer          default("available_balance")
#
# Indexes
#
#  index_accounts_on_account_type              (account_type)
#  index_accounts_on_user_id_and_account_type  (user_id,account_type) UNIQUE
#

class Account < ApplicationRecord
  ZERO = 0.to_d
  FIX = :fix
  UNKNOWN = :unknown
  STRIKE_ADD = :strike_add
  STRIKE_SUB = :strike_sub
  STRIKE_FEE = :strike_fee
  STRIKE_UNLOCK = :strike_unlock
  ORDER_BUY = :order_buy
  ORDER_UNLOCK = :order_unlock
  WITHDRAW_LOCK = :withdraw_lock
  WITHDRAW_UNLOCK = :withdraw_unlock
  DEPOSIT = :deposit
  WITHDRAW = :withdraw
  TRANSFER_IN = :transfer_in
  TRANSFER_OUT = :transfer_out
  REWARD = :reward
  SUPER_VIP_UNLOCK = :super_vip_unlock

  FUNS = {:unlock_funds => 1, :lock_funds => 2, :plus_funds => 3, :sub_funds => 4, :unlock_and_sub_funds => 5}

  belongs_to :user
  has_one :payment_address
  has_many :versions, class_name: "::AccountVersion"
  # has_many :deposits
  # has_many :withdraws

  # Suppose to use has_one here, but I want to store
  # relationship at account side. (Daniel)

  enum :account_type => {
    :available_balance => 0,
    :activity_balance => 1
  }

  validates :user_id, uniqueness: {scope: [:account_type]}
  validates_numericality_of :balance, :locked, greater_than_or_equal_to: ZERO

  # def payment_address
  #   payment_addresses.last || payment_addresses.create(currency: self.currency)
  # end

  def address
    payment_address.try :address
  end

  def self.after(*names)
    names.each do |name|
      m = instance_method(name.to_s)
      define_method(name.to_s) do |*args, &block|
        m.bind(self).(*args, &block)
        yield(self, name.to_sym, *args)
        self
      end
    end
  end

  def plus_funds(amount, fee: ZERO, reason: nil, ref: nil)
    raise ArgumentError, 'Amount must be larger than 0' if amount <= ZERO
    raise AccountError, "cannot add funds (account: #{id} fee #{fee} amount: #{amount})" if (fee > amount)
    change_balance_and_locked amount, 0
  end

  def sub_funds(amount, fee: ZERO, reason: nil, ref: nil)
    raise ArgumentError, 'Amount must be larger than 0' if amount <= ZERO
    raise InsufficientBalanceError, "Account #{id} Cannot subtract funds (amount: #{amount}), insufficient balance (#{self.balance})" if amount > self.balance
    change_balance_and_locked( -amount, 0)
  end

  def lock_funds(amount, reason: nil, ref: nil)
    raise ArgumentError, 'amount must be larger than 0' if amount <= ZERO
    raise InsufficientBalanceError, "Account #{id} Cannot lock funds (amount: #{amount}), insufficient balance (#{self.balance})" if amount > self.balance
    change_balance_and_locked( -amount, amount)
  end

  def unlock_funds(amount, reason: nil, ref: nil)
    raise ArgumentError, "Account #{id} amount #{amount} must be larger than 0" if amount <= ZERO
    raise AccountError, "Account #{id} cannot unlock funds (amount: #{amount}) locked (#{self.locked})" if amount > self.locked
    change_balance_and_locked amount, -amount
  end

  def unlock_and_sub_funds(amount, locked: ZERO, fee: ZERO, reason: nil, ref: nil)
    raise ArgumentError, 'amount must be larger than 0' if amount <= ZERO
    raise AccountError, "Account #{id} cannot unlock and subtract funds (amount: #{amount})" if amount > locked
    raise LockedError, "invalid lock amount" unless locked
    raise LockedError, "Account #{id} invalid lock amount (amount: #{amount}, unlock: #{locked}, locked: #{self.locked})" if ((locked <= 0) or (locked > self.locked))
    change_balance_and_locked locked-amount, -locked
  end

  after(*FUNS.keys) do |account, fun, changed, opts|
    begin
      opts ||= {}
      fee = opts[:fee] || ZERO
      reason = opts[:reason] || Account::UNKNOWN

      attributes = { fun: fun,
                     fee: fee,
                     reason: reason,
                     amount: account.amount,
                     user_id: account.user_id,
                     account_id: account.id }

      if opts[:ref] and opts[:ref].respond_to?(:id)
        ref_klass = opts[:ref].class
        attributes.merge! \
          modifiable_id: opts[:ref].id,
          modifiable_type: ref_klass.respond_to?(:base_class) ? ref_klass.base_class.name : ref_klass.name
      end

      locked, balance = compute_locked_and_balance(fun, changed, opts)
      attributes.merge! locked: locked, balance: balance

      AccountVersion.optimistically_lock_account_and_create!(account.balance, account.locked, attributes)
    rescue ActiveRecord::StaleObjectError
      Rails.logger.info "Stale account##{account.id} found when create associated account version, retry."
      account = Account.find(account.id)
      raise ActiveRecord::RecordInvalid, account unless account.valid?
      retry
    end
  end

  def self.compute_locked_and_balance(fun, amount, opts)
    raise AccountError, "Account #{id} invalid account operation" unless FUNS.keys.include?(fun)

    case fun
    when :sub_funds then [ZERO, ZERO - amount]
    when :plus_funds then [ZERO, amount]
    when :lock_funds then [amount, ZERO - amount]
    when :unlock_funds then [ZERO - amount, amount]
    when :unlock_and_sub_funds
      locked = ZERO - opts[:locked]
      balance = opts[:locked] - amount
      [locked, balance]
    else raise AccountError, "Account #{id} forbidden account operation"
    end
  end

  def amount
    self.balance + self.locked
  end

  def last_version
    versions.last
  end

  def rollback_to!(time)
    transaction do
      v = versions.where('created_at >= ?', time).to_a
      if v.count > 0
        v.each do |i|
          puts i.attributes
        end
        self.balance -= v.map(&:balance).sum
        self.locked -= v.map(&:locked).sum
        save!
        versions.where('created_at >= ?', time).delete_all
      end
    end
  end

  def replay_versions
    self.balance = versions.order(id: :asc).sum(:balance)
    self.locked = versions.order(id: :asc).sum(:locked)
    save!
  end

  def examine
    expected = 0
    versions.find_each(batch_size: 100000) do |v|
      expected += v.amount_change
      return false if expected != v.amount
    end

    expected == self.amount
  end

  def change_balance_and_locked(delta_b, delta_l)
    self.balance += delta_b
    self.locked  += delta_l
    self.class.connection.execute "update accounts set balance = balance + #{delta_b}, locked = locked + #{delta_l} where id = #{id}"
    add_to_transaction # so after_commit will be triggered
    self
  end

  class AccountError < RuntimeError; end
  class LockedError < AccountError; end
  class BalanceError < AccountError; end
  class InsufficientBalanceError < AccountError; end

end
