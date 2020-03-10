class AddTimeLimitToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :start_at, :datetime
    add_column :products, :end_at, :datetime
    add_column :products, :allow_hours, :text, :array => true
    Product.all.each do |product|
      product.update(:start_at => '2018-01-01')
      product.update(:end_at => '2020-01-01')
      product.update(:allow_hours => ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"])
    end
  end
end
