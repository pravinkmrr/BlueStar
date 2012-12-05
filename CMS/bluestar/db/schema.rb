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

ActiveRecord::Schema.define(:version => 20121120165648) do

  create_table "advertisements", :force => true do |t|
    t.string   "image"
    t.string   "filename"
    t.integer  "event_id_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "link"
  end

  add_index "advertisements", ["event_id_id"], :name => "index_advertisements_on_event_id_id"

  create_table "agendas", :force => true do |t|
    t.string   "name"
    t.binary   "pdf"
    t.string   "filename"
    t.string   "content_type"
    t.integer  "event_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "agendas", ["event_id"], :name => "index_agendas_on_event_id"

  create_table "alerts", :force => true do |t|
    t.date     "date"
    t.time     "time"
    t.string   "title"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "blobs", :force => true do |t|
    t.binary   "file"
    t.string   "filename"
    t.string   "content_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "calenders", :force => true do |t|
    t.string   "title"
    t.text     "message"
    t.time     "time"
    t.date     "date"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "calenders", ["event_id"], :name => "index_calenders_on_event_id"

  create_table "eicons", :force => true do |t|
    t.string   "icon"
    t.string   "icon_file"
    t.string   "icon_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.binary   "logo"
    t.string   "filename"
    t.string   "content_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "right_file"
    t.string   "right_filename"
    t.integer  "region_id"
  end

  create_table "exhibitors", :force => true do |t|
    t.string   "name"
    t.binary   "pdf"
    t.string   "filename"
    t.string   "content_type"
    t.integer  "event_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "exhibitors", ["event_id"], :name => "index_exhibitors_on_event_id"

  create_table "guides", :force => true do |t|
    t.string   "name"
    t.binary   "pdf"
    t.string   "filename"
    t.string   "content_type"
    t.integer  "event_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "guides", ["event_id"], :name => "index_guides_on_event_id"

  create_table "icons", :force => true do |t|
    t.string   "icon_name"
    t.string   "icon_file"
    t.string   "icon"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "keynotes", :force => true do |t|
    t.string   "name"
    t.binary   "pdf"
    t.string   "filename"
    t.string   "content_type"
    t.integer  "event_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "keynotes", ["event_id"], :name => "index_keynotes_on_event_id"

  create_table "links", :force => true do |t|
    t.string   "links_url"
    t.integer  "type_id"
    t.integer  "region_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "links", ["region_id"], :name => "index_links_on_region_id"
  add_index "links", ["type_id"], :name => "index_links_on_type_id"

  create_table "maps", :force => true do |t|
    t.string   "name"
    t.binary   "pdf"
    t.string   "filename"
    t.string   "content_type"
    t.integer  "event_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "maps", ["event_id"], :name => "index_maps_on_event_id"

  create_table "presentations", :force => true do |t|
    t.string   "name"
    t.string   "filename"
    t.integer  "workshop_id"
    t.integer  "event_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "pdf"
  end

  add_index "presentations", ["event_id"], :name => "index_presentations_on_event_id"
  add_index "presentations", ["workshop_id"], :name => "index_presentations_on_workshop_id"

  create_table "qrcodes", :force => true do |t|
    t.string   "link"
    t.string   "app_name"
    t.string   "device"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "regions", :force => true do |t|
    t.string   "region_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tests", :force => true do |t|
    t.string   "name"
    t.string   "filename"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "types", :force => true do |t|
    t.string   "type_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.binary   "pdf"
    t.string   "filename"
    t.string   "content_type"
    t.integer  "event_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "venues", ["event_id"], :name => "index_venues_on_event_id"

  create_table "welcomes", :force => true do |t|
    t.string   "name"
    t.binary   "pdf"
    t.string   "filename"
    t.string   "content_type"
    t.integer  "event_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "welcomes", ["event_id"], :name => "index_welcomes_on_event_id"

  create_table "workshops", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
