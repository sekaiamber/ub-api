class Api::V1::AccountsController < Api::V1::BaseController
  before_action :authenticate_user!
  def index
    @accounts = Currency.all.map do |currency|
      current_user.account(currency)
    end
  end
end
