class Api::V1::WithdrawsController < Api::V1::BaseController
  before_action :authenticate_user!#, :only => %w(index)
  def index
    @withdraws = current_user.withdraws
  end

  def create
    if (current_user.self_and_ancestors.pluck(:id) & Settings.withdraw_black_list.split(',').map(&:to_i)).present?
      render_err_item(ErrItem.new('withdraw', 'stop'))
      return
    end
    unless current_user.can_withdraw?(params[:amount].to_d || 0.to_d)
      render_err_item(ErrItem.new('withdraw', 'stop'))
      return
    end
    withdraw = Withdraw.new(:user => current_user, :sum => params[:amount], :fund_uid => params[:to])
    if withdraw.save
      withdraw.submit!
      withdraw.accept!
      withdraw.process!
      render :json => {:success => true}
      return
    end
    render_err_pack(withdraw.err_pack)
  end
end
