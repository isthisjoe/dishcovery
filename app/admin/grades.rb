ActiveAdmin.register Grade do
  index do
    column :id
    column :text
    column :value
    
    default_actions
  end
  
  form do |f|
    f.inputs "Grade" do
      f.input :text
      f.input :value
    end
    f.buttons
  end
end
