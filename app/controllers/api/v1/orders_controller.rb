class Api::V1::OrdersController < Api::V1::BaseController
  before_action :auth_id_document!, :only => [:create]
  def index
    @orders = current_user.orders
  end

  def create
    product = Product.find(params[:product_id])
    unless product.can_buy?
      render_err_item(ErrItem.new('product', 'can_not_buy'))
      return
    end
    @order = current_user.orders.new(:product => product)
    if @order.save
      render :json => {:success => true}
      return
    end
    render_err_pack(@order.err_pack)
  end

  def done
    order = Order.find(params[:id])
    if order.success!
      render :json => {:success => true}
      return
    end
    render_err_item(ErrItem.new('order', 'can_not_unlock'))
  end
end
