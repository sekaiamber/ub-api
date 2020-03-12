json.data do
  json.(@user, :id, :nickname, :phone_number, :invite_code)
  json.level @user.vip_level_before_type_cast
  json.id_document do
    json.(@user.id_document, :name, :id_document_number, :state)
  end
  json.children do
    []
    # json.array! @user.children do |child|
    #   json.phone_number child.phone_number.cover_up
    #   json.nickname child.nickname
    # end
  end
end
