class CreateTests < ActiveRecord::Migration
  def self.up
    create_table :tests, :force => true do |t|
      
      t.column :student_id, :integer
      t.column :date, :date
      t.column :result, :string
      t.column :comments, :string

      t.timestamps
    end
  end

  def self.down
    drop_table :tests
  end
end
