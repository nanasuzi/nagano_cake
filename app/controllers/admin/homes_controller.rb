class Admin::HomesController < AdminsController
  def top
    @orders = Order.page(params[:page]).reverse_order
    case params[:order_sort]
      when "0"
        @customer = Customer.find(params[:customers_number])
        @orders = @customer.orders.page(params[:page]).reverse_order

      when "1"
        @orders = Order.page(params[:page]).reverse_order
    end
  end
end
