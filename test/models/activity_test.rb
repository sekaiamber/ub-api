# == Schema Information
#
# Table name: activities
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  activity_type :integer
#  amount        :decimal(36, 18)
#  order_id      :integer
#  state         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_activities_on_order_id  (order_id)
#  index_activities_on_user_id   (user_id)
#

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
