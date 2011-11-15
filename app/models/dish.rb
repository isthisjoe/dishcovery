class Dish < ActiveRecord::Base
  belongs_to :dish_type
  belongs_to :place
  belongs_to :average_grade, :class_name => "Grade"
  has_many :dishes
  has_many :gradings
  
  accepts_nested_attributes_for :gradings, :allow_destroy => true
  
  def serializable_hash(options = {}) 
    options = {
      :include => [:dish_type, :place, :average_grade], 
      :except => [:dish_type_id, :place_id, :created_at, :updated_at]
    }.merge(options ||= {})
    super options
  end
  
  def calculate_average_grade
    gradings_count = self.gradings.count
    puts "Total gradings: %d" % gradings_count
    total_gradings_value = 0
    self.gradings.each do |grading|
      total_gradings_value += grading.grade.value
      puts "Total gradings value: %d" % total_gradings_value
    end
    self.average_grade = Grade.find_by_value((total_gradings_value/gradings_count).round)
    puts "Average grade calculation: %s" % self.average_grade.text
  end
end
