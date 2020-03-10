json.data @banners.map do |banner|
  json.image banner.image.url
  json.url banner.url
end
