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

ActiveRecord::Schema.define(version: 2020_06_07_075002) do

  create_table "charas", force: :cascade do |t|
    t.string "chara_name"
    t.string "chara_icon"
    t.integer "cast_id"
    t.string "tag1"
    t.string "tag2"
    t.string "tag3"
    t.string "tag4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "work_id"
  end

  create_table "members", force: :cascade do |t|
    t.integer "user_id"
    t.integer "work_id"
    t.string "job"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progresses", force: :cascade do |t|
    t.string "chara_icon"
    t.string "chara_name"
    t.string "work_name"
    t.string "work_status"
    t.string "update_date"
    t.string "job"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string "section_name"
    t.integer "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "task_title"
    t.integer "user_id"
    t.integer "wrok_id"
    t.integer "chara_id"
    t.datetime "deadline"
    t.string "task_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "done"
    t.string "work_name"
    t.string "chara_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "user_twitter_id"
    t.string "user_icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "work_members", force: :cascade do |t|
    t.integer "user_id"
    t.integer "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "works", force: :cascade do |t|
    t.string "work_name"
    t.string "work_status"
    t.string "work_ico"
    t.string "work_top_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
