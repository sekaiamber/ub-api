# == Schema Information
#
# Table name: mobile_apps
#
#  id            :integer          not null, primary key
#  name          :integer
#  version       :string(50)
#  secret        :string(32)
#  app_key       :string(32)
#  deprecated_at :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_mobile_apps_on_app_key           (app_key)
#  index_mobile_apps_on_name_and_version  (name,version) UNIQUE
#

require 'test_helper'

class MobileAppTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
