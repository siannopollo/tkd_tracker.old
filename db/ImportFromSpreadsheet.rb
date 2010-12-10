RAILS_ENV = 'development'
require File.dirname(__FILE__) + '/../config/environment'
require 'faster_csv'
 
FasterCSV.foreach("/attendance.csv") do |row|
    student = Student.new
    student.last_name = row[0]
    student.first_name = row[1]
    student.last_test = row[3]
    student.rank = row[4]
    student.school_id = 2
    
    attendance = Attendance.new
    attendance.number_of_classes= row[2]
    
    student.attendances << attendance
    
    student.save
       
end