class AddAccountTypeToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :account_type, :integer, :default => 0
    remove_index :accounts, :user_id
    add_index :accounts, :account_type
    add_index :accounts, [:user_id, :account_type], :unique => true
    Activity.registe.submitted.each do |activity|
      activity.success!
    end
  end
end
