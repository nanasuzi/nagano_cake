class AddChangeCloumnsConstraintToItems < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :genre_id, false
    change_column_null :items, :name, false
    change_column_null :items, :image_id, false
    change_column_null :items, :introduction, false
    change_column_null :items, :price, false
  end
end
