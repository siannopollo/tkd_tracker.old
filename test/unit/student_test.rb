require 'test/test_helper'
require 'date'

class StudentTest < ActiveSupport::TestCase
  
  def setup()
    @white_belt = Student.new
    @white_belt.rank = 10
    
    @mighty_kid_green_belt = Student.new
    @mighty_kid_green_belt.rank = 11
    
    @attendance = Attendance.new
    
    attendance_array = Array.new
    attendance_array << @attendance
    
    @white_belt.attendances = attendance_array
    @mighty_kid_green_belt.attendances = attendance_array
    
  end
  
  test "new student should be ineligible to test" do
    student = Student.new
    assert(!student.is_eligible_to_test(Date.today));
  end
  
  test "white belt ineligible to test because of testing date" do
    @white_belt.last_test = Date.civil(2010, 1, 6)
    @attendance.number_of_classes = 28
    @attendance.created_at = Date.civil(2010, 1, 7)
    
    assert(!@white_belt.is_eligible_to_test(Date.civil(2010, 2, 7)))
  end
  
  test "white belt ineligible to test due to not enough classes" do
    @white_belt.last_test = Date.civil(2010, 1, 6)
    @attendance.number_of_classes = 5
    @attendance.created_at = Date.civil(2010, 1, 7)
    
    assert(!@white_belt.is_eligible_to_test(Date.civil(2010, 6, 7)))
    
    @attendance.number_of_classes = 23 
    assert(!@white_belt.is_eligible_to_test(Date.civil(2010, 6, 7)))
  end
  
  test "white belt eligible to test" do
    @white_belt.last_test = Date.civil(2010, 1, 6)
    @attendance.number_of_classes = 24
    @attendance.created_at = Date.civil(2010, 1, 7)
    
    assert(@white_belt.is_eligible_to_test(Date.civil(2010, 4, 6)))
  end
  
  test "mighty kid tranition to regular class" do
    @mighty_kid_green_belt.last_test = Date.civil(2010, 1, 6)
    @attendance.number_of_classes = 12
    @attendance.created_at = Date.civil(2010, 1, 7)
    
    assert(@mighty_kid_green_belt.is_eligible_to_test(Date.civil(2010, 4, 6)))
    
    assert(!@mighty_kid_green_belt.is_eligible_to_test(Date.civil(2010, 3, 6)))
    
    @attendance.number_of_classes = 11
    assert(!@mighty_kid_green_belt.is_eligible_to_test(Date.civil(2010, 4, 6)))
  end
   
end
