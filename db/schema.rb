# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130404002936) do

  create_table "customers", :force => true do |t|
    t.string   "F_name"
    t.string   "L_name"
    t.string   "email"
    t.integer  "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "inventories", :force => true do |t|
    t.string   "equipment_type"
    t.string   "equipment_name"
    t.integer  "num_of_items"
    t.float    "rental_price"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "rentals", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "inventory_id"
    t.integer  "quantity"
    t.date     "return_date"
    t.string   "event_name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "rentals", ["customer_id"], :name => "index_rentals_on_customer_id"
  add_index "rentals", ["inventory_id"], :name => "index_rentals_on_inventory_id"

end
