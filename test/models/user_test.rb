# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  nickname        :string(255)
#  password_digest :string(255)
#  invite_code     :string(255)
#  phone_number    :string(255)
#  vip_level       :integer          default("normal")
#  parent_id       :integer
#  lft             :integer          not null
#  rgt             :integer          not null
#  depth           :integer          default(0), not null
#  children_count  :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  api_token       :string(255)
#
# Indexes
#
#  index_users_on_invite_code   (invite_code) UNIQUE
#  index_users_on_lft           (lft)
#  index_users_on_nickname      (nickname) UNIQUE
#  index_users_on_parent_id     (parent_id)
#  index_users_on_phone_number  (phone_number) UNIQUE
#  index_users_on_rgt           (rgt)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
