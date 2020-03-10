class DecimalTo3618 < ActiveRecord::Migration[5.1]
  def change
    change_column :account_versions, :balance, :decimal, precision: 36, scale: 18
    change_column :account_versions, :locked, :decimal, precision: 36, scale: 18
    change_column :account_versions, :fee, :decimal, precision: 36, scale: 18
    change_column :account_versions, :amount, :decimal, precision: 36, scale: 18

    change_column :accounts, :balance, :decimal, precision: 36, scale: 18
    change_column :accounts, :locked, :decimal, precision: 36, scale: 18
    change_column :accounts, :in, :decimal, precision: 36, scale: 18
    change_column :accounts, :out, :decimal, precision: 36, scale: 18

    change_column :activities, :amount, :decimal, precision: 36, scale: 18
    change_column :products, :price, :decimal, precision: 36, scale: 18
    change_column :products, :reward, :decimal, precision: 36, scale: 18

    change_column :transfers, :amount, :decimal, precision: 36, scale: 18
    change_column :transfers, :fee, :decimal, precision: 36, scale: 18
  end
end
