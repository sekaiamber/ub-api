class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.integer :user_id, :index => {:unique => true}, :null => true
      t.decimal :balance, :default => 0
      t.decimal :locked, :default => 0
      t.decimal :in
      t.decimal :out
      t.integer :default_withdraw_fund_source_id

      t.timestamps
    end
  end
end
