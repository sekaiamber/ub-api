class DepositsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    md5 = Digest::MD5.hexdigest(deposit_params.to_json + 'VCKVKtn9uhQ3')
    if md5 == params[:md5]
      currency_id = Currency.find_by(:code => params[:currency]).id
      return unless currency_id.present?
      payment_address = PaymentAddress.find_by(:currency_id => currency_id, :address => params[:to])
      if payment_address
        account = payment_address.account
        user = account.user
        deposit = Deposit.find_or_create_by(:user => user, :account => account, :txid => params[:txid], :fund_uid => params[:to], :amount => params[:amount], :currency_id => currency_id)
        deposit.submit! if deposit.submitting?
        deposit.update(:confirmations => params[:confirmations])
        deposit.accept! if params[:confirmed]
      end
      head :no_content
      return
    end
    p 'Deposit API return false'
    p params
    head :no_content
  end

  def deposit_params
    params.permit(:currency, :tag, :txid, :to, :amount, :confirmations, :confirmed)
  end
end
