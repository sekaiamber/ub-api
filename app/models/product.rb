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
#  days        :integer
#  vip_level   :integer          default(0)
#  power       :integer          default(0)
#

class Product < ApplicationRecord
  serialize :allow_hours, Array
  has_many :orders
  mount_uploader :image, ProductUploader
  def allow_hours_enum
    (0..23).to_a
  end

  def can_buy?
    ((self.start_at.to_i..self.end_at.to_i).include? Time.current.to_i) && (self.allow_hours.include? Time.current.hour.to_s)
  end
end
