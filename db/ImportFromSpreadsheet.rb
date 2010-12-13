RAILS_ENV = 'development'
require File.dirname(__FILE__) + '/../config/environment'
require 'faster_csv'

def date?(date)
   begin
     Date.parse(date.to_s)
   rescue ArgumentError
     return false
   end  
   return true
 end
 
def is_a_number?(s)
  s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
end

processing_record = 0
FasterCSV.foreach("/ruby scripts/rails/TkdTracker/db/ODTKD_Attendance.csv") do |row|
    processing_record += 1
    puts "processing record #{processing_record}"
    
    student = Student.new
    student.last_name = row[0]
    student.first_name = row[1]
    
    if row[3] && date?(row[3])
     student.last_test = row[3]
    end
    
    if row[4] && is_a_number?(row[4]) then
      student.rank = row[4]
    end
    
    student.school_id = 1
    
    if (row[2].to_i != 0) then
      attendance = Attendance.new
      attendance.number_of_classes= row[2]    
      student.attendances << attendance
    end
    
    student.save
       
end