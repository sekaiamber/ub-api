class SmsNotificationJob < ApplicationJob

  def perform(phone_number:, message:)
    Sms.new(phone_number, message).perform
  end

end
