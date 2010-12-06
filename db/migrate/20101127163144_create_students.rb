class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :rank, :integer
      t.column :last_test, :date
      t.column :school_id, :integer
      t.column :email_address, :string
      t.column :phone, :string
      

      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
