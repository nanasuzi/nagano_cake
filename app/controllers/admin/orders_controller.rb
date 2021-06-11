class Admin::OrdersController < AdminsController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
     @order = Order.find(params[:id])
     @order.update(order_params)

     if @order.order_status == "入金確認"
        @order.order_details.update_all(making_status: "製作待ち")
     end

     redirect_to admin_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
