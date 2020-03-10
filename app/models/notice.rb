# == Schema Information
#
# Table name: notices
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Notice < ApplicationRecord
end
