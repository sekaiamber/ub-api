# == Schema Information
#
# Table name: id_documents
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  id_document_number    :string(255)
#  user_id               :integer
#  idcard_person_info    :string(255)
#  idcard_cover          :string(255)
#  person_holding_idcard :string(255)
#  state                 :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'test_helper'

class IdDocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
