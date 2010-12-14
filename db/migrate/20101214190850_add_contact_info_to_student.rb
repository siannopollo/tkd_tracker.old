class AddContactInfoToStudent < ActiveRecord::Migration
  def self.up
    add_column :students, :phone_two, :string
    add_column :students, :parent_name, :string
  end

  def self.down
    drop_column :students, :phone_two
    drop_column :students, :parent_name
  end
end
