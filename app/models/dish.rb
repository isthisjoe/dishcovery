class Dish < ActiveRecord::Base
  belongs_to :dish_type
  belongs_to :place
  has_many :dishes
  has_many :gradings
  accepts_nested_attributes_for :gradings, :allow_destroy => true
  
  def serializable_hash(options = {}) 
    options = {
      :include => [:dish_type, :place], 
      :except => [:dish_type_id, :place_id, :created_at, :updated_at]
    }.merge(options ||= {})
    super options
  end
end
