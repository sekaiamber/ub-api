class RemoveAccountTypeFromAccounts < ActiveRecord::Migration[5.1]
  def change
    remove_index :accounts, [:user_id, :account_type]
    remove_column :accounts, :account_type, :integer
    add_index :accounts, [:user_id, :currency_id]
  end
end
