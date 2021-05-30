class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @cart_item = CartItem.new
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if customer_signed_in?
      @cart_item.save
      redirect_to cart_items_path
    else
      redirect_to new_customer_registration_path
    end
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
