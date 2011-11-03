ActiveAdmin.register User do
  index do
    column :id
    column :email
    column :username
    column :first_name
    column :last_name
    
    default_actions
  end
end
