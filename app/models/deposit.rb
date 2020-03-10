# == Schema Information
#
# Table name: deposits
#
#  id            :integer          not null, primary key
#  account_id    :integer
#  user_id       :integer
#  amount        :decimal(36, 18)
#  fee           :decimal(36, 18)
#  fund_uid      :string(255)
#  fund_extra    :string(255)
#  txid          :string(255)
#  state         :integer          default("submitting")
#  confirmations :integer
#  done_at       :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_deposits_on_account_id  (account_id)
#  index_deposits_on_fund_uid    (fund_uid)
#  index_deposits_on_state       (state)
#  index_deposits_on_user_id     (user_id)
#

class Deposit < ApplicationRecord
  include AASM
  belongs_to :user
  belongs_to :account

  enum :state => {
    :submitting => 0,
    :cancelled => 1,
    :submitted => 2,
    :rejected => 3,
    :accepted => 4,
    :checked => 5,
    :warning => 6
  }

  aasm :column => :state, :whiny_transitions => false do
    state :submitting, initial: true, before_enter: :set_fee
    state :cancelled
    state :submitted
    state :rejected
    state :accepted
    state :checked
    state :warning

    event :submit do
      transitions from: :submitting, to: :submitted
    end

    event :cancel do
      transitions from: :submitting, to: :cancelled
    end

    event :reject do
      transitions from: :submitted, to: :rejected
    end

    event :accept, after_commit: [:done_it!] do
      transitions from: :submitted, to: :accepted
    end

    event :check do
      transitions from: :accepted, to: :checked
    end

    event :warn do
      transitions from: :accepted, to: :warning
    end
  end

  def done_it!
    self.update(:done_at => Time.current)
    account.plus_funds(amount, :reason => :deposit, :ref => self)
  end

end
