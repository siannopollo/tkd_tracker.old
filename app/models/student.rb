require 'date'
require 'testing_requirements'

class Student < ActiveRecord::Base
  has_many :attendances
  has_one :school
  
  def after_initialize
    if self[:rank] == nil then
      self[:rank] = 10
    end
    
    if self[:last_test] == nil then 
      self[:last_test] = Date.today
    end
    
    if self[:classes_since_last_test] == nil then
      self[:classes_since_last_test] = 0  
    end
  end
  
  def is_eligible_to_test(actual_test_date, credit_for_additional_classes=0)
    if rank == 1
      return false
    end
    
    test_requirement = TestingRequirements.by_gup[rank - 1]
    
    eligible_test_date = self[:last_test] >> test_requirement["months"]
    if actual_test_date < eligible_test_date then
      return false
    end
     
    classes_taken = number_of_classes_since_last_test() + credit_for_additional_classes   
    if classes_taken < test_requirement["classes"] then
      return false
    end
    
    return true
  end
  
  private
  def number_of_classes_since_last_test()
    attendances = Attendance.find(:all, :conditions => "student_id = '#{self[:id]}' AND created_at > '#{self[:last_test]}'") 
    class_count = 0
    attendances.each { |attendance|
      class_count += attendance.number_of_classes
    }
    return class_count
  end
end
