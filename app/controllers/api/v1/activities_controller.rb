class Api::V1::ActivitiesController < Api::V1::BaseController
  before_action :authenticate_user!
  def index
    @activities = current_user.activities.done
  end
end
