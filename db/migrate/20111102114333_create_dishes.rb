class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.references :dish_type
      t.references :place

      t.timestamps
    end
    add_index :dishes, :dish_type_id
    add_index :dishes, :place_id
  end
end
