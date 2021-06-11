class Admin::OrderDetailsController < AdminsController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)

    if @order_detail.making_status == "製作中"
       @order_detail.order.update(order_status: "製作中")
    end

      @order = @order_detail.order
      if @order.order_details.count == @order.order_details.where(making_status: "製作完了").count
         @order_detail.order.update(order_status: "発送準備中")
      end

    redirect_to admin_order_path(@order_detail.order_id)
  end


  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
