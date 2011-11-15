class Grade < ActiveRecord::Base
  has_many :gradings
  has_one :dish, :class_name => "Dish", :foreign_key => "average_grade_id"
  accepts_nested_attributes_for :gradings, :allow_destroy => true
  
  def serializable_hash(options = {}) 
    options = { 
      :except => [:created_at, :updated_at]
    }.merge(options ||= {})
    super options
  end
end
