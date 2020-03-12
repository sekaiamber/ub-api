# == Schema Information
#
# Table name: withdraws
#
#  id          :integer          not null, primary key
#  sn          :string(255)
#  account_id  :integer
#  user_id     :integer
#  amount      :decimal(36, 18)
#  fee         :decimal(36, 18)
#  fund_uid    :string(255)
#  done_at     :datetime
#  txid        :string(255)
#  state       :integer
#  sum         :decimal(36, 18)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  currency    :string(255)      default("BASE")
#  currency_id :integer
#

require 'test_helper'

class WithdrawTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
