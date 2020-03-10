# == Schema Information
#
# Table name: transfers
#
#  id         :integer          not null, primary key
#  from_id    :integer
#  to_id      :integer
#  amount     :decimal(36, 18)
#  fee        :decimal(36, 18)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_transfers_on_from_id  (from_id)
#  index_transfers_on_to_id    (to_id)
#

class Transfer < ApplicationRecord
  RATE = 0.to_d
  belongs_to :from, class_name: 'Account'
  belongs_to :to, class_name: 'Account'
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :fee, presence: true, numericality: { greater_than_or_equal_to: 0 }
  before_validation :set_fee
  after_create :do_transfer!

  def set_fee
    self.fee = amount.to_d * RATE
  end

  def do_transfer!
    from.sub_funds amount, reason: :transfer_out, ref: self
    to.plus_funds amount - fee, reason: :transfer_in, ref: self
  end
end
