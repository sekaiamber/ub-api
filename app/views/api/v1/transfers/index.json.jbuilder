json.data @transfers.map do |transfer|
  if transfer.from_id == current_user.account.id
    json.type '转出'
    json.phone_number transfer.to.user.phone_number
  else
    json.type '转入'
    json.phone_number transfer.from.user.phone_number
  end
  json.amount transfer.amount
  json.time transfer.created_at.strftime('%Y/%m/%d %H:%M')
end
