# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  price       :decimal(36, 18)
#  reward      :decimal(36, 18)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string(255)
#  start_at    :datetime
#  end_at      :datetime
#  allow_hours :text(65535)
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
