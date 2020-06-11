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

ActiveRecord::Schema.define(version: 2020_06_11_171748) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "calenders", force: :cascade do |t|
    t.string "work_id"
    t.string "integer"
    t.integer "section_id"
    t.string "recording"
    t.string "datetime"
    t.string "mixing"
    t.string "release"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.integer "chara_id"
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

  create_table "scripts", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string "section_name"
    t.integer "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "recording"
    t.datetime "mixing"
    t.datetime "release"
  end

  create_table "staffs", force: :cascade do |t|
    t.integer "member_id"
    t.string "join"
    t.string "boolean"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "section_id"
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

  create_table "timetables", force: :cascade do |t|
    t.string "title"
    t.datetime "deadline"
    t.integer "work_id"
    t.integer "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "user_twitter_id"
    t.string "user_icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "password_confirmation"
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
