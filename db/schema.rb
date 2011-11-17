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

ActiveRecord::Schema.define(:version => 20111117192813) do

  create_table "attendances", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "circle_memberships", :force => true do |t|
    t.boolean  "share_score", :default => false
    t.boolean  "favorite"
    t.boolean  "accepted",    :default => false
    t.integer  "circle_id"
    t.integer  "user_id"
    t.integer  "color_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "owner",       :default => false
  end

  create_table "circles", :force => true do |t|
    t.string   "title"
    t.boolean  "public"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colors", :force => true do |t|
    t.string   "hex"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.text     "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "google_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "where"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text     "content"
    t.string   "lat"
    t.string   "lng"
    t.boolean  "public",     :default => true
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.text     "personal_goal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
  end

end
