class Api::V1::AccountsController < Api::V1::BaseController
  before_action :authenticate_user!
  def index
    @account = current_user.account
    @activity_balance = current_user.account('activity_balance')
  end
end
