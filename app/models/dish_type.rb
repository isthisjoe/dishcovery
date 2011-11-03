class DishType < ActiveRecord::Base
  has_many :dishes, :class_name => "dish"
end
