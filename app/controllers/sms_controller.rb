class SmsController < ApplicationController
  before_action :auth_phone_number!

  def create
    if User.where(phone_number: params[:phone_number]).exists?
      render :json => {
        :success => false,
        :errors => [I18n.t('err_item.identity.bad_number')]
      }
      return
    end
    send_sms if create_lock.get
    render json: {success: true}
  end

  private
  def send_sms
    otp_secret = Rails.cache.fetch([:verify, params[:phone_number]], expires_in: 30.minutes) do
      '%06d' % SecureRandom.random_number(1000000)
    end
    SmsNotificationJob.perform_later phone_number: params[:phone_number], message: I18n.t('sms.verification_code', code: otp_secret)
  end

  def create_lock
    AtField::Lock.new(:name => 'send_sms_activation', :scope => params[:phone_number], :expiry => 60)
  end

  def auth_phone_number!
    render :json => {
      :success => false,
      :errors => [I18n.t('err_item.identity.bad_number')]
    } unless params[:phone_number]
  end
end
