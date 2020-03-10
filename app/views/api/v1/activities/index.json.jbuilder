json.data @activities.map do |activity|
  json.(activity, :title, :description, :amount)
  json.time activity.updated_at.strftime('%Y-%m-%d')
end
