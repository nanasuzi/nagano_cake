class Admin::HomesController < AdminsController
  def top
    @orders = Order.all
    case params[:order_sort]
      when "0"
        @customer = Customer.find(params[:customers_number])
        @orders = @customer.orders

      when "1"
        @orders = Order.all
    end
  end
end
