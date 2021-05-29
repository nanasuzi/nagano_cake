class AddChangeColumnsConstraintToOrderDatails < ActiveRecord::Migration[5.2]
  def change
    change_column_null :order_details, :item_id, false
    change_column_null :order_details, :order_id, false
    change_column_null :order_details, :price, false
    change_column_null :order_details, :amount, false
    change_column_null :order_details, :making_status, false
  end
end
