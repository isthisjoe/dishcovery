class AddAverageGradeToDish < ActiveRecord::Migration
  def change
    add_column :dishes, :average_grade_id, :integer
  end
end
