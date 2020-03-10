class Api::V1::NoticesController < Api::V1::BaseController
  def index
    @notices = Notice.all.reverse
  end
end
