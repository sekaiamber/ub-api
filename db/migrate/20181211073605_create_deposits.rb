class CreateDeposits < ActiveRecord::Migration[5.1]
  def change
    create_table :deposits do |t|
      t.integer :account_id, :index => true
      t.integer :user_id, :index => true
      t.decimal :amount, precision: 36, scale: 18
      t.decimal :fee, precision: 36, scale: 18
      t.string :fund_uid, :index => true
      t.string :fund_extra
      t.string :txid
      t.integer :state, :default => 0, :index => true
      t.integer :confirmations
      t.datetime :done_at

      t.timestamps
    end
  end
end
