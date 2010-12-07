require 'test/test_helper'

class StudentTest < ActiveSupport::TestCase
  fixtures :students, :attendances
  
  test "new student should be ineligible to test" do
    student = Student.new
    assert(!student.is_eligible_to_test(Date.today));
  end
  
  test "JoeJoe should be eligible to test" do
    joejoe = Student.find(:first, :conditions => "first_name = 'JoeJoe'")
    assert(joejoe.is_eligible_to_test(Date::civil(2011, 4, 5)))
  end
  
  test "JoeJoe has not had enough time to be eligible to test" do
    joejoe = Student.find(:first, :conditions => "first_name = 'JoeJoe'")
    assert(!joejoe.is_eligible_to_test(Date::civil(2010, 12, 15)))
  end
  
  test "Sally does not have enough classes to be eligible to test" do
    sally = Student.find(:first, :conditions => "first_name = 'Sally'")
    assert(!sally.is_eligible_to_test(Date::civil(2011, 4, 5)))
  end
  
  test "Sally has enough classes when given credit for additional classes" do
    sally = Student.find(:first, :conditions => "first_name = 'Sally'")
    assert(sally.is_eligible_to_test(Date::civil(2011, 4, 5), 23))
  end
  
  test "mighty kid Jason does not have enough classes to test" do
    jason = Student.find(:first, :conditions => "first_name = 'Jason'")
    assert(!jason.is_eligible_to_test(Date::civil(2011, 4, 5)))
  end
  
end
