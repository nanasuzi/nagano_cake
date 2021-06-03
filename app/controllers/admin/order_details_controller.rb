class Admin::OrderDetailsController < AdminsController
  def update
    @order_detail = OrderDetail.find(params[:id])
  end


  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
