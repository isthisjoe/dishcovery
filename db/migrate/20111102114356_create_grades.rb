class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :value
      t.string :text

      t.timestamps
    end
  end
end
