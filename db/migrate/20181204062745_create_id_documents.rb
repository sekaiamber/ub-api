class CreateIdDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :id_documents do |t|
      t.string :name
      t.string :id_document_number
      t.integer :user_id
      t.string :idcard_person_info
      t.string :idcard_cover
      t.string :person_holding_idcard
      t.integer :state

      t.timestamps
    end
  end
end
