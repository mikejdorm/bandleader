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

ActiveRecord::Schema.define(:version => 20130314181746) do

  create_table "connections", :force => true do |t|
    t.integer  "station_id"
    t.integer  "user_id"
    t.datetime "connection_time"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "posts", :force => true do |t|
    t.integer  "station_id"
    t.string   "post_time"
    t.string   "datetime"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "songs", :force => true do |t|
    t.string   "artist"
    t.string   "title"
    t.string   "album"
    t.string   "link"
    t.string   "info"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "station_id",     :default => 0
    t.integer  "user_id",        :default => 0
    t.integer  "votes_count",    :default => 0
    t.datetime "broadcast_time"
  end

  create_table "stations", :force => true do |t|
    t.string   "event_name"
    t.string   "event_location"
    t.datetime "date_created"
    t.datetime "date_ended"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "votes", :force => true do |t|
    t.integer  "station_id"
    t.integer  "song_id"
    t.integer  "user_id"
    t.datetime "vote_time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
