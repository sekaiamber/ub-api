class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user!, :only => %w(destroy)

  def create
    inviter = User.find_by(:invite_code => params[:invite_code])
    unless inviter
      render_err_item(ErrItem.new('user', 'wrong_invite_code'))
      return
    end
    secret = Rails.cache.read([:verify, params[:phone_number]])
    if secret.nil? || params[:verify_code] != secret
      render_err_item(ErrItem.new('sms', 'bad_verify_code'))
      return
    end
    @user = inviter.children.new(user_params)
    @user.api_token = SecureRandom.hex(16)
    if @user.save
      payload = {
        :member_id => @user.id,
        :member_token => @user.api_token
      }
      member = @mobile_app.encode(payload)
      render :json => {
        :success => true,
        :data => {
          :member => member
        }
      }
      return
    end
    render_err_pack(@user.err_pack)
  end

  def user_params
    params.permit(:nickname, :password, :password_confirmation, :phone_number )
  end
end
