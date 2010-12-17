class AddInactiveFlagToStudent < ActiveRecord::Migration
  def self.up
    add_column :students, :inactive, :boolean
    
    Student.find(:all).each do |student|
      student.update_attribute :inactive, 'f'
    end
  end

  def self.down
    remove_column :students, :inactive
  end
end
