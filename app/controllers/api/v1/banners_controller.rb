class Api::V1::BannersController < Api::V1::BaseController
  def index
    @banners = Banner.all
  end
end
