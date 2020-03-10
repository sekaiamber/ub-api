json.data @notices.map do |notice|
  json.title notice.title
  json.content notice.content
  json.time notice.created_at.strftime('%Y/%m/%d')
end
