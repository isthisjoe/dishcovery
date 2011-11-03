class CreateGradings < ActiveRecord::Migration
  def change
    create_table :gradings do |t|
      t.references :dish
      t.references :user
      t.references :grade

      t.timestamps
    end
    add_index :gradings, :dish_id
    add_index :gradings, :user_id
    add_index :gradings, :grade_id
  end
end
