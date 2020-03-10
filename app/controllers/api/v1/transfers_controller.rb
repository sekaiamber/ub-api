class Api::V1::TransfersController < Api::V1::BaseController
  before_action :authenticate_user!
  def index
    account_ids = Account.where(:user_id => current_user.id).pluck(:id)
    @transfers = Transfer.where('from_id in (?) or to_id in (?)', account_ids, account_ids)
  end

  def create
    user = User.find_by(:phone_number => params[:phone_number])
    unless user
      render_err_item(ErrItem.new('transfer', 'no_user'))
      return
    end
    unless params[:amount]
      render_err_item(ErrItem.new('transfer', 'amount_wrong'))
      return
    end
    if current_user.transfer_to(user, params[:amount])
      render :json => {:success => true}
      return
    end
    render_err_item(ErrItem.new('transfer', 'error'))
  end

end
