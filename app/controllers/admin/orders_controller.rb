class Admin::OrdersController < AdminsController
  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
  end

  def update
     @order = Order.find(params[:id])
     @order.update(order_params)
     redirect_to admin_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
