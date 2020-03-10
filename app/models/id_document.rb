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

class IdDocument < ApplicationRecord
  include AASM

  belongs_to :user
  validates_uniqueness_of :user
  mount_uploader :idcard_person_info, IdImageUploader
  mount_uploader :idcard_cover, IdImageUploader
  mount_uploader :person_holding_idcard, IdImageUploader

  validates_presence_of :name, :on => :update
  validates :id_document_number, :presence => true, :on => :update

  enum :state => {
    :unverified => 0,
    :verifying => 1,
    :verified => 2
  }
  aasm column: :state do
    state :unverified, initial: true
    state :verifying
    state :verified

    event :submit do
      transitions from: :unverified, to: :verifying
    end

    event :approve do
      transitions from: [:unverified, :verifying],  to: :verified
    end

    event :reject do
      transitions from: [:verifying, :verified],  to: :unverified
    end
  end

end
