class CreateCurrencies < ActiveRecord::Migration[5.1]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :code
      t.string :address_pattern
      t.boolean :visible, :default => false
      t.boolean :depositable, :default => false
      t.boolean :withdrawable, :default => false

      t.timestamps
    end
    add_column :deposits, :currency_id, :integer, :index => true
    add_column :accounts, :currency_id, :integer, :index => true
    add_column :withdraws, :currency_id, :integer, :index => true
    add_column :orders, :currency_id, :integer, :index => true

    add_index :currencies, :code
  end
end
