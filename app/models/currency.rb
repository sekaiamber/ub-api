# == Schema Information
#
# Table name: currencies
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  code            :string(255)
#  address_pattern :string(255)
#  visible         :boolean          default(FALSE)
#  depositable     :boolean          default(FALSE)
#  withdrawable    :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_currencies_on_code  (code)
#

class Currency < ApplicationRecord
end
