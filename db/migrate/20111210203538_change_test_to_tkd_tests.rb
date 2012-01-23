class ChangeTestToTkdTests < ActiveRecord::Migration
  def self.up
    rename_table :tests, :tkd_tests
  end

  def self.down
    rename_table :tkd_tests, :tests
  end
end
