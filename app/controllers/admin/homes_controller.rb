class Admin::HomesController < AdminsController
  before_action :authenticate!

def authenticate!
  if admin_signed_in?
    authenticate_admin!
  else
    redirect_to new_admin_session_path
  end
end


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
