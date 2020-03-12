# == Schema Information
#
# Table name: payment_addresses
#
#  id         :integer          not null, primary key
#  account_id :integer
#  address    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PaymentAddress < ApplicationRecord
  belongs_to :account
  before_create :set_address

  def set_address
    response = JSON.parse Typhoeus::Request.new("#{ENV['WALLET_URL']}/wallets", method: 'POST', body: {currency: account.currency.code, tag: account.user_id}).run.body
    # self.address = Bip44::Wallet.from_mnemonic('harsh stable fabric silent student clap mass ancient cable gauge there grass tourist rookie offer', "m/44'/60'/0'/0/#{account.user_id}").ethereum_address
    self.address = response['data']
  rescue
    nil
  end
end
