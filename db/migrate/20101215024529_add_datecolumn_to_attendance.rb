class AddDatecolumnToAttendance < ActiveRecord::Migration
  def self.up
    add_column :attendances, :date, :date
    
    attendances = Attendance.find(:all)
    attendances.each do |attendance|
      if attendance.created_at then
        attendance.date = attendance.created_at.to_date
        attendance.save
      end
    end
  end

  def self.down
    remove_column :attendances, :date
  end
end
