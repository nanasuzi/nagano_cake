class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def update
    current_customer.update(customer_params)
    redirect_to customers_path
  end

  def check
  end

  def withdrawl
    current_customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end
end
