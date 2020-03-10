class CreateTransfers < ActiveRecord::Migration[5.1]
  def change
    create_table :transfers do |t|
      t.integer :from_id, :index => true
      t.integer :to_id, :index => true
      t.decimal :amount
      t.decimal :fee

      t.timestamps
    end
  end
end
