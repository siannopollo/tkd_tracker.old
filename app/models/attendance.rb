class Attendance < ActiveRecord::Base
  belongs_to :student
  
  def after_initialize
    if self[:date] == nil then
      date = Date.today
    end
  end
end
