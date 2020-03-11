class SignUpController < ApplicationController
  layout false

  def index
    @user = User.new(:invite_code => params[:invite_code])
  end

  def create
    inviter = User.find_by(:invite_code => params[:user][:invite_code])
    @user = User.new(user_params.merge!(:invite_code => params[:user][:invite_code]))
    unless inviter
      flash[:error] = I18n.t('err_item.user.wrong_invite_code.message')
      redirect_to action: :index, :invite_code => params[:user][:invite_code]
      return
    end
    unless Settings.debug?
      secret = Rails.cache.read([:verify, user_params[:phone_number]])
      if secret.nil? || params[:user][:verify_code] != secret
        flash[:error] = I18n.t('err_item.sms.bad_verify_code.message')
        redirect_to action: :index, :invite_code => params[:user][:invite_code]
        return
      end
    end
    @user = inviter.children.new(user_params)
    @user.api_token = SecureRandom.hex(16)
    if @user.save
      flash[:success] = '注册成功, 请下载app后进行操作'
      redirect_to '/'
      return
    end
    flash[:error] = @user.errors.full_messages.join(', ')
    redirect_to action: :index, :invite_code => params[:user][:invite_code]
  end

  private
  def user_params
    params[:user][:phone_number] = "86#{params[:user][:phone_number]}" if params[:user][:phone_number].first(2) != '86'
    params.require(:user).permit(:nickname, :password, :password_confirmation, :phone_number )
  end
end
