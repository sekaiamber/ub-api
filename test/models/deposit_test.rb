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
#  currency      :string(255)      default("BASE")
#  currency_id   :integer
#
# Indexes
#
#  index_deposits_on_account_id  (account_id)
#  index_deposits_on_fund_uid    (fund_uid)
#  index_deposits_on_state       (state)
#  index_deposits_on_user_id     (user_id)
#

require 'test_helper'

class DepositTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
