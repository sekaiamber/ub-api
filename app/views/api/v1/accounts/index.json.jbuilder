json.data @accounts.map do |account|
  json.(account.currency, :code, :name, :visible, :depositable, :withdrawable)
  json.(account, :balance, :locked, :address)
  # json.(account.payment_address, :address)
end
