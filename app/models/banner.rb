# == Schema Information
#
# Table name: banners
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Banner < ApplicationRecord
  mount_uploader :image, BannerUploader
end
