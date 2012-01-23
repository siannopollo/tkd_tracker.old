class AddTesterTest < ActiveRecord::Migration
  def self.up
    add_column :tests, :tester, :string
  end

  def self.down
    remove_column :tests, :tester
  end
end
