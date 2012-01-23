RAILS_ENV = 'development'
require File.dirname(__FILE__) + '/../config/environment'

puts "before find"
students = Students.find(:all)
puts "before update"

found = Array.new
students.each {|student|
  if student.inactive == 'f' then
    puts "#{student.last_name}, #{student.first_name}"
  end
}

    