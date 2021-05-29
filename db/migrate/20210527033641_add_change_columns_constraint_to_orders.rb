class AddChangeColumnsConstraintToOrders < ActiveRecord::Migration[5.2]
  def change
    change_column_null :orders, :customer_id, false
    change_column_null :orders, :postal_code, false
    change_column_null :orders, :address, false
    change_column_null :orders, :name, false
    change_column_null :orders, :shipping_cost, false
    change_column_null :orders, :billing_amount, false
    change_column_null :orders, :method_of_payment, false
    change_column_null :orders, :order_status, false
  end
end
