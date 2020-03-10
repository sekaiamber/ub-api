# == Schema Information
#
# Table name: account_versions
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  account_id      :integer
#  reason          :integer
#  balance         :decimal(36, 18)  default(0.0)
#  locked          :decimal(36, 18)  default(0.0)
#  fee             :decimal(36, 18)  default(0.0)
#  amount          :decimal(36, 18)
#  modifiable_id   :integer
#  modifiable_type :string(255)
#  fun             :integer
#  created_at      :datetime
#
# Indexes
#
#  index_account_versions_on_account_id                         (account_id)
#  index_account_versions_on_account_id_and_reason              (account_id,reason)
#  index_account_versions_on_modifiable_type_and_modifiable_id  (modifiable_type,modifiable_id)
#  index_account_versions_on_user_id                            (user_id)
#  index_account_versions_on_user_id_and_reason                 (user_id,reason)
#

class AccountVersion < ApplicationRecord
  SPARSE_GAP = 100000

  HISTORY = [Account::STRIKE_ADD, Account::STRIKE_SUB, Account::STRIKE_FEE, Account::DEPOSIT, Account::WITHDRAW, Account::FIX]

  enum :fun => Account::FUNS

  REASON_CODES = {
    Account::UNKNOWN => 0,
    Account::FIX => 1,
    Account::TRANSFER_OUT => 2,
    Account::TRANSFER_IN => 3,
    Account::REWARD => 4,
    Account::STRIKE_FEE => 100,
    Account::STRIKE_ADD => 110,
    Account::STRIKE_SUB => 120,
    Account::STRIKE_UNLOCK => 130,
    Account::WITHDRAW_LOCK => 800,
    Account::WITHDRAW_UNLOCK => 810,
    Account::DEPOSIT => 1000,
    Account::WITHDRAW => 2000,
    Account::ORDER_BUY => 3000,
    Account::ORDER_UNLOCK => 3001,
    Account::SUPER_VIP_UNLOCK => 3002
  }
  enum :reason => REASON_CODES
  belongs_to :user
  belongs_to :account
  belongs_to :modifiable, polymorphic: true

  scope :history, -> { with_reason(*HISTORY).reverse_order }

  # Use account balance and locked columes as optimistic lock column. If the
  # passed in balance and locked doesn't match associated account's data in
  # database, exception raise. Otherwise the AccountVersion record will be
  # created.
  #
  # TODO: find a more generic way to construct the sql
  def self.optimistically_lock_account_and_create!(balance, locked, attrs)
    attrs = attrs.symbolize_keys
    Rails.logger.debug(attrs)
    attrs[:created_at] = Time.now
    attrs[:fun]        = Account::FUNS[attrs[:fun]]
    attrs[:reason]     = REASON_CODES[attrs[:reason]]

    account_id = attrs[:account_id]
    Rails.logger.info([balance, locked, attrs])
    raise ActiveRecord::ActiveRecordError, "account must be specified" unless account_id.present?

    qmarks       = (['?']*attrs.size).join(',')
    values_array = [qmarks, *attrs.values]
    values       = ActiveRecord::Base.send :sanitize_sql_array, values_array

    select = Account.unscoped.select(values).where(id: account_id, balance: balance, locked: locked).to_sql
    stmt   = "INSERT INTO account_versions (#{attrs.keys.join(',')}) #{select}"

    connection.insert(stmt).tap do |id|
      if id == 0
        record = new attrs
        raise ActiveRecord::StaleObjectError.new(record, "create")
      end
    end
  end

  def detail_template
    if self.detail.nil? || self.detail.empty?
      return ["system", {}]
    end

    [self.detail.delete(:tmp) || "default", self.detail || {}]
  end

  def amount_change
    (balance || ZERO) + (locked || ZERO)
  end

  def in
    amount_change > 0 ? amount_change : nil
  end

  def out
    amount_change < 0 ? amount_change : nil
  end

  def self.rollback_all(id)

    where('id > ?', id).order(id: :desc).find_each do |i|
      puts i.attributes
      connection.execute("UPDATE accounts SET balance=balance-'#{i.balance.to_s}', locked=locked-'#{i.locked.to_s}' where id=#{i.account_id}")
      i.destroy
    end
  end

  alias :template :detail_template
end
