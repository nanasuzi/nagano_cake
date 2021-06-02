class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def update
  end

  def check
  end

  def withdrawl
    current_customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end
end
