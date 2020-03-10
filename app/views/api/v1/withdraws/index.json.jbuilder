json.data @withdraws.map do |withdraw|
  json.amount withdraw.sum
  json.(withdraw, :fee, :txid, :state)
  json.created_at withdraw.created_at.strftime('%Y-%m-%d')
end
