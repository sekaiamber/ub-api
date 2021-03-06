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

require 'test_helper'

class AccountVersionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
