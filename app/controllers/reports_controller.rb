require 'student'

class ReportsController < ApplicationController
  def test_eligibility
    begin
      @schools = School.find(:all, :order => "name")
      @students_eligible_to_test = Array.new
      actual_test_date = params[:test_date]
      
      if actual_test_date != nil && actual_test_date.length > 0 then
        actual_test_date = Date.parse(actual_test_date)
        students = students_to_check(params[:school])
    
        students.each { |student| 
          if student.is_eligible_to_test(actual_test_date, params[:fudge_factor]) then
            @students_eligible_to_test << student
          end   
        }
        
        if @students_eligible_to_test.length == 0 then
          flash.now[:notice] = 'There are no students eligible to test on this date.'
        end
      end
    rescue
      flash.now[:error] = "Please enter a valid date in the format of YYYY-DD-MM"
    end
  
    render "test_eligibility"
    
  end
  
  private
  def students_to_check(school_id)
    if school_id != nil then
      return Student.find(:all, :conditions => "school_id = '#{school_id}'")
    end
      
    return Student.find(:all)
  end
end
