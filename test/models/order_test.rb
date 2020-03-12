# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  user_id     :integer
#  unlock_at   :datetime
#  state       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  end_at      :datetime
#  reward      :decimal(36, 18)
#  power       :integer          default(0)
#  price       :decimal(36, 18)
#  currency    :string(255)      default("BASE")
#  base_count  :decimal(36, 18)  default(0.0)
#  currency_id :integer
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
