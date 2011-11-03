ActiveAdmin.register DishType do
  index do
    column :id
    column :name
    column :description
    default_actions
  end
end
