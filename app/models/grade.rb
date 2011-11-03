class Grade < ActiveRecord::Base
  has_many :gradings
  accepts_nested_attributes_for :gradings, :allow_destroy => true
end
