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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151030220908) do

  create_table "bigbluebutton_metadata", force: :cascade do |t|
    t.integer  "owner_id",   limit: 4
    t.string   "owner_type", limit: 255
    t.string   "name",       limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bigbluebutton_playback_formats", force: :cascade do |t|
    t.integer  "recording_id", limit: 4
    t.string   "format_type",  limit: 255
    t.string   "url",          limit: 255
    t.integer  "length",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bigbluebutton_recordings", force: :cascade do |t|
    t.integer  "server_id",  limit: 4
    t.integer  "room_id",    limit: 4
    t.string   "recordid",   limit: 255
    t.string   "meetingid",  limit: 255
    t.string   "name",       limit: 255
    t.boolean  "published",              default: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "available",              default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bigbluebutton_recordings", ["recordid"], name: "index_bigbluebutton_recordings_on_recordid", unique: true, using: :btree
  add_index "bigbluebutton_recordings", ["room_id"], name: "index_bigbluebutton_recordings_on_room_id", using: :btree

  create_table "bigbluebutton_rooms", force: :cascade do |t|
    t.integer  "server_id",          limit: 4
    t.integer  "owner_id",           limit: 4
    t.string   "owner_type",         limit: 255
    t.string   "meetingid",          limit: 255
    t.string   "attendee_key",       limit: 255
    t.string   "moderator_key",      limit: 255
    t.boolean  "private",                        default: false
    t.string   "name",               limit: 255
    t.string   "attendee_password",  limit: 255
    t.string   "moderator_password", limit: 255
    t.string   "welcome_msg",        limit: 255
    t.string   "logout_url",         limit: 255
    t.string   "voice_bridge",       limit: 255
    t.string   "dial_number",        limit: 255
    t.integer  "max_participants",   limit: 4
    t.boolean  "external",                       default: false
    t.string   "param",              limit: 255
    t.boolean  "record_meeting",                 default: false
    t.integer  "duration",           limit: 4,   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bigbluebutton_rooms", ["meetingid"], name: "index_bigbluebutton_rooms_on_meetingid", unique: true, using: :btree
  add_index "bigbluebutton_rooms", ["server_id"], name: "index_bigbluebutton_rooms_on_server_id", using: :btree
  add_index "bigbluebutton_rooms", ["voice_bridge"], name: "index_bigbluebutton_rooms_on_voice_bridge", unique: true, using: :btree

  create_table "bigbluebutton_server_configs", force: :cascade do |t|
    t.integer  "server_id",         limit: 4
    t.text     "available_layouts", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bigbluebutton_servers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "url",        limit: 255
    t.string   "salt",       limit: 255
    t.string   "version",    limit: 255
    t.string   "param",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
