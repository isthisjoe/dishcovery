ActiveAdmin.register Dish do
  index do
    column :id
    column "Dish Type" do |dish| 
      dish.dish_type.name
    end
    
    column "Place" do |dish|
      dish.place.name
    end
    
    default_actions
  end
end
