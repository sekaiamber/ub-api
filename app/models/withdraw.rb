# == Schema Information
#
# Table name: withdraws
#
#  id         :integer          not null, primary key
#  sn         :string(255)
#  account_id :integer
#  user_id    :integer
#  amount     :decimal(36, 18)
#  fee        :decimal(36, 18)
#  fund_uid   :string(255)
#  done_at    :datetime
#  txid       :string(255)
#  state      :integer
#  sum        :decimal(36, 18)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Withdraw < ApplicationRecord
  ZERO = 0.to_d
  include AASM

  enum :state => {
    :submitting => 0,
    :submitted => 1,
    :rejected => 2,
    :accepted => 3,
    :suspect => 4,
    :processing => 5,
    :done => 6,
    :canceled => 7,
    :almost_done => 8,
    :failed => 9
  }


  belongs_to :user
  belongs_to :account

  before_validation :fix_precision
  before_validation :calc_fee
  before_validation :set_account
  after_create :generate_sn

  validates :fund_uid, :amount, :fee, :account, :user, presence: true

  validates :fee, numericality: {greater_than_or_equal_to: 0}
  validates :amount, numericality: {greater_than: 0}

  validates :sum, presence: true, numericality: {greater_than: 0}, on: :create
  validates :txid, uniqueness: true, allow_nil: true, on: :update
  validate :validate_address_pattern, on: :create

  validate :ensure_account_balance, on: :create

  scope :completed, -> { where state: COMPLETED_STATES }
  scope :not_completed, -> { where.not state: COMPLETED_STATES }

  alias_attribute :withdraw_id, :sn
  alias_attribute :full_name, :member_name

  def generate_sn
    id_part = sprintf '%04d', id
    date_part = created_at.localtime.strftime('%y%m%d%H%M')
    self.sn = "#{date_part}#{id_part}"
    update_column(:sn, sn)
  end

  aasm :column => :state, :whiny_transitions => false do
    state :submitting,  initial: true
    state :submitted
    state :canceled
    state :accepted
    state :suspect
    state :rejected
    state :processing
    state :almost_done
    state :done
    state :failed

    event :submit do
      transitions from: :submitting, to: :submitted
      after do
        lock_funds
      end
    end

    event :cancel, after: :after_cancel, after_commit: [:process_it] do
      transitions from: [:submitting, :submitted], to: :canceled
    end

    event :mark_suspect, after_commit: :send_email do
      transitions from: :submitted, to: :suspect
    end

    event :accept, after_commit: [:process_it] do
      transitions from: :submitted, to: :accepted
    end

    event :reject, after_commit: [:process_it] do
      transitions from: [:submitted, :accepted, :processing], to: :rejected
      after :unlock_funds
    end

    event :process, after_commit: [:process_it, :send_coins!] do
      transitions from: :accepted, to: :processing
    end

    event :call_rpc do
      transitions from: :processing, to: :almost_done
    end

    event :succeed, after_commit: [:done_it] do
      transitions from: [:accepted, :processing, :almost_done], to: :done

      # TODO: unlock应该放到after，在before里的话，可以被重复执行
      before [:set_txid, :unlock_and_sub_funds]
    end

    event :fail do
      transitions from: [:accepted, :processing, :almost_done], to: :failed
      after :unlock_funds
    end
  end

  def cancelable?
    submitting? or submitted? or accepted?
  end

  def passed?
    cancelable?
  end

  def can_manually_mark_succeed?
    processing? && updated_at < 3.hours.ago
  end

  private

  def validate_address_pattern
    reg = /0x[a-fA-F0-9]{40}/
    unless  fund_uid =~ reg
      errors.add(:fund_uid, "提现地址错误")
    end
  end

  def after_cancel
    unlock_funds unless aasm.from_state == :submitting
  end

  def lock_funds
    account.lock!
    account.lock_funds sum, reason: Account::WITHDRAW_LOCK, ref: self
  end

  def unlock_funds
    account.lock!
    account.unlock_funds sum, reason: Account::WITHDRAW_UNLOCK, ref: self
  end

  def unlock_and_sub_funds
    account.lock!
    account.unlock_and_sub_funds sum, locked: sum, fee: fee, reason: Account::WITHDRAW, ref: self
  end

  def process_it
    true
    # 记录process时间
  end

  def done_it
    self.done_at = Time.now
  end

  def set_txid
    self.done_at = Time.now
  end

  def send_coins!
    request = Typhoeus.post(
      "#{ENV['WALLET_URL']}/wallets/send",
      body: {
        currency: 'ASTARF',
        sn: self.sn,
        amount: self.amount,
        to: self.fund_uid
      }
    ).body
    request = JSON.parse request rescue {}
    p request
    if request && request['success']
      self.txid = request['data']['txId']
      # service = WalletService.get currency
      # tx = service.send_to(sn, fund_uid, amount)
      # self.txid = tx['txId']
      # self.succeed if self.txid
      save!
      self.succeed!
    else
      Rails.logger.error request['error']
      raise StandardError, request['error']
    end
  end

  def ensure_account_balance
    if sum.nil? or sum > account.balance
      errors.add :base, '余额不足'
    end
  end

  def fix_precision
    if sum
      self.sum = sum.round(18, BigDecimal::ROUND_DOWN)
    end
  end

  def calc_fee
    set_fee
    self.sum ||= ZERO
    self.fee ||= ZERO
    self.amount = sum - fee
  end

  def set_account
    self.account = user.account
  end

  def set_fee
    p sum
    self.fee = 0.02 * sum
    return self.fee = 10.to_d if self.fee < 10.to_d
    return self.fee = 9999999999999.to_d if self.fee > 9999999999999.to_d
  end
end
