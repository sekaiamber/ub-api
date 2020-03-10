class CreateWithdraws < ActiveRecord::Migration[5.1]
  def change
    create_table :withdraws do |t|
      t.string :sn
      t.integer :account_id
      t.integer :user_id
      t.decimal :amount, precision: 36, scale: 18
      t.decimal :fee, precision: 36, scale: 18
      t.string :fund_uid
      t.datetime :done_at
      t.string :txid
      t.integer :state
      t.decimal :sum, precision: 36, scale: 18

      t.timestamps
    end
  end
end
