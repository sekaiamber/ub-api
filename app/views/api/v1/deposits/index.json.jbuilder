json.data @deposits.map do |deposit|
  json.(deposit, :amount, :txid, :state, :confirmations)
  json.created_at deposit.created_at.strftime('%Y-%m-%d')
end
