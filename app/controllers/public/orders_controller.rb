class Public::OrdersController < ApplicationController
  def new
    if current_customer.cart_items.present?
    @order = Order.new
    @order.customer_id = current_customer.id
    @addresses = current_customer.addresses
    else
    flash[:notice] = "カートが空です。何か商品を入れて下さい。"
    redirect_to request.referer
    end
  end

  def check
     @order = Order.new(order_params)
     @order.shipping_cost = 800
     @order.customer_id = current_customer.id
     @cart_items = current_customer.cart_items

    if params[:order][:address_option] == "0"
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code

    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.name = @address.name
      @order.postal_code = @address.postal_code
      @order.address = @address.address

    else  params[:order][:address_option] == "2"


    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save

    current_customer.cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.item_id = cart_item.item_id
      order_detail.order_id = @order.id
      order_detail.price = cart_item.item.price * 1.1
      order_detail.amount = cart_item.amount
    　order_detail.save
    end
        current_customer.cart_items.destroy_all

        redirect_to orders_complete_path

    else
      @addresses = current_customer.addresses
      render:new
    end

  end

  def index
    @orders = current_customer.orders
    @cart_items = current_customer.cart_items
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :method_of_payment, :shipping_cost, :billing_amount)
  end
end
