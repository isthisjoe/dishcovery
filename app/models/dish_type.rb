class DishType < ActiveRecord::Base
  has_many :dishes
  
  def serializable_hash(options = {}) 
    options = { 
      :except => [:created_at, :updated_at]
    }.merge(options ||= {})
    super options
  end
end
