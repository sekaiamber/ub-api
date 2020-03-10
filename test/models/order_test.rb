# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  product_id :integer
#  user_id    :integer
#  unlock_at  :datetime
#  state      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
