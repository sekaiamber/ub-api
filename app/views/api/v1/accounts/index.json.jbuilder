json.data do
  json.balance @account.balance
  json.locked @account.locked
  json.activity_balance @activity_balance.balance
end
