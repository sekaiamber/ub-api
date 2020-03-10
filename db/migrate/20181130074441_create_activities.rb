class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :activity_type
      t.decimal :amount
      t.integer :order_id
      t.integer :state

      t.timestamps
    end

    add_index :activities, :user_id
    add_index :activities, :order_id
  end
end
