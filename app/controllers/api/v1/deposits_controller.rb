class Api::V1::DepositsController < Api::V1::BaseController
  before_action :authenticate_user!#, :only => %w(index)
  def index
    @deposits = current_user.deposits
  end
end
