class CreateAttendances < ActiveRecord::Migration
  def self.up
    create_table :attendances do |t|
      t.column :student_id, :integer
      t.column :number_of_classes, :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :attendances
  end
end
