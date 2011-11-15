class Grade < ActiveRecord::Base
  has_many :gradings
  accepts_nested_attributes_for :gradings, :allow_destroy => true
  
  def serializable_hash(options = {}) 
    options = { 
      :except => [:created_at, :updated_at]
    }.merge(options ||= {})
    super options
  end
end
