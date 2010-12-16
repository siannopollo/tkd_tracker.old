class AddInactiveFlagToStudent < ActiveRecord::Migration
  def self.up
    add_column :students, :inactive, :boolean, :default => false
  end

  def self.down
    remove_column :students, :inactive
  end
end