class Api::V1::MyController < Api::V1::BaseController
  before_action :authenticate_user!#, :only => %w(index)
  def index
    @user = current_user
  end

  def invite_page
    
  end

end
