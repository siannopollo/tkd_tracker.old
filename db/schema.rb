# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101212015101) do

  create_table "attendances", :force => true do |t|
    t.integer   "student_id"
    t.integer   "number_of_classes"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "schools", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "students", :force => true do |t|
    t.string    "first_name"
    t.string    "last_name"
    t.integer   "rank"
    t.date      "last_test"
    t.integer   "school_id"
    t.string    "email_address"
    t.string    "phone"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "tests", :force => true do |t|
    t.string   "result"
    t.string   "comment"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
