class Api::V1::ResetPasswordController < Api::V1::BaseController
  before_action :auth_captcha!
  def create
    if params[:verify_code] == Rails.cache.read([:verify, params[:phone_number]])
      user = User.find_by(:phone_number => params[:phone_number])
      user.update(:password => params[:password], :password_confirmation => params[:password_confirmation], :api_token => nil)
      render json: {success: true}
      return
    end
    render_err_item(ErrItem.new('sms', 'bad_verify_code'))
  end
end
