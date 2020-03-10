json.data do
  json.products @products.map do |product|
    next unless product.can_buy?
    json.(product, :id, :price, :reward)
    json.image product.image.url
  end
  json.can_buy current_user&.can_buy? || false
end
