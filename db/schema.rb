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

ActiveRecord::Schema.define(version: 20151211165901) do

  create_table "crawler_sessions", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "screenshots", force: :cascade do |t|
    t.string   "file_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "url_histories", force: :cascade do |t|
    t.integer  "url_id"
    t.integer  "crawler_session_id"
    t.integer  "screenshot_id"
    t.float    "diff_to_previous"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "url_histories", ["crawler_session_id"], name: "index_url_histories_on_crawler_session_id"
  add_index "url_histories", ["screenshot_id"], name: "index_url_histories_on_screenshot_id"
  add_index "url_histories", ["url_id"], name: "index_url_histories_on_url_id"

  create_table "urls", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
