class Grading < ActiveRecord::Base
  belongs_to :dish
  belongs_to :user
  belongs_to :grade
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :dish
  accepts_nested_attributes_for :grade
  
end
