RAILS_ENV = 'development'
require File.dirname(__FILE__) + '/../config/environment'

attendances = Attendance.find(:all, :conditions => "date = '2011-02-08'")
puts "before delete there are #{attendances.length}"

found = Array.new
attendances.each {|attendance|
  if found.include?(attendance.student_id) then
    attendance.delete
  else
    found << attendance.student_id
  end 
}

attendances = Attendance.find(:all, :conditions => "date = '2011-02-08'")
puts "after delete there are #{attendances.length}"
    