class Sms
  def initialize(phone_number, message)
    @phone_number = phone_number
    @message = message
  end

  def perform
    request = Typhoeus::Request.new(
      "http://send.18sms.com/msg/HttpBatchSendSM",
      method: :post,
      body: {
        account: "o3749j",
        pswd: "9K0y8dJ5",
        mobile: @phone_number,
        msg: @message,
        resptype: "json"
      }
    )
    response = JSON.parse request.run.body
  end
end
