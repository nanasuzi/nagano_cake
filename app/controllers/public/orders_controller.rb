class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    @addresses = current_customer.addresses
  end

  def check
     @order = Order.new(order_params)
     @order.shipping_cost = 800
     @order.customer_id = current_customer.id
     @cart_items = current_customer.cart_items

    if params[:order][:address_option] == 0
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code

    elsif params[:order][:address_option] == 1
      @order.address = current_customer.addresses.address
      @order.name = current_customer.addresses.name
      @order.postal_code = current_customer.addresses.postal_code

    else params[:order][:address_option] == 2

    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_complete_path
  end

  def index
    @orders = Order.all
    @cart_items = current_customer.cart_items
  end

  def show
    @order = Order.find(params[:id])
    @cart_items = current_customer.cart_items
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :method_of_payment, :shipping_cost, :billing_amount)
  end
end
