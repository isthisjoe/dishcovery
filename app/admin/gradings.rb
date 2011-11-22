ActiveAdmin.register Grading do
  
  index do
    column :id
    column "Dish" do |grading|
      grading.dish.dish_type.name
    end
    column "Place" do |grading| 
      grading.dish.place.name
    end
    column "User" do |grading|
      grading.user.email
    end
    column "Grade" do |grading|
      grading.grade.text
    end
    
    default_actions
  end
  
  show do |grading|
    attributes_table do 
      row("Dish") { grading.dish.dish_type.name }
      row("Place") { grading.dish.place.name }
      row :user
      row("Grade") { grading.grade.text }
    end
  end
  
  form do |f|
    f.inputs "Gradings" do
      f.input :dish, :as => :select, :collection => Hash[*Dish.all.collect { |v|
          ["%s (%s)" % [v.dish_type.name,v.place.name], v.id] }.flatten]
      f.input :user
      f.input :grade, :as => :select, :collection => Hash[*Grade.all.collect { |v|
          [v.text,v.id] }.flatten]
      
    end
    
    f.buttons
  end
end
