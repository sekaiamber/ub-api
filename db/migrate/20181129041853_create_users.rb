class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nickname, :index => {:unique => true}
      t.string :password_digest
      t.string :invite_code, :index => {:unique => true}
      t.string :phone_number, :index => {:unique => true}
      t.integer :vip_level, :default => 0
      t.integer :parent_id, :null => true, :index => true
      t.integer :lft, :null => false, :index => true
      t.integer :rgt, :null => false, :index => true

      # optional fields
      t.integer :depth, :null => false, :default => 0
      t.integer :children_count, :null => false, :default => 0
      t.timestamps
    end
  end
end
