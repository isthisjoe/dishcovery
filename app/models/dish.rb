class Dish < ActiveRecord::Base
  belongs_to :dish_type
  belongs_to :place
  has_many :dishes
  has_many :gradings
  accepts_nested_attributes_for :gradings, :allow_destroy => true
end
