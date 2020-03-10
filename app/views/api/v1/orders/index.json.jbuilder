json.data @orders.map do |order|
  json.(order, :id, :state)
  json.unlock_at order.unlock_at.to_i
  json.created_at order.created_at.strftime('%Y-%m-%d')
  json.price order.product.price
  json.reward order.product.reward
end
