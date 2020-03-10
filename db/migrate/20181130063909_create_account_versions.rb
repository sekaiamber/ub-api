class CreateAccountVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :account_versions do |t|
      t.integer :user_id, :index => true
      t.integer :account_id, :index => true
      t.integer :reason
      t.decimal :balance, :default => 0
      t.decimal :locked, :default => 0
      t.decimal :fee, :default => 0
      t.decimal :amount
      t.integer :modifiable_id
      t.string :modifiable_type
      t.integer :fun

      t.datetime :created_at
    end
    add_index :account_versions, [:user_id, :reason]
    add_index :account_versions, [:account_id, :reason]
    add_index :account_versions, [:modifiable_type, :modifiable_id]
  end
end
