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

ActiveRecord::Schema.define(version: 20171023170055) do

  create_table "answers", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
  end

  add_index "answers", ["student_id"], name: "index_answers_on_student_id"

  create_table "friendships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
    t.integer  "friend_id"
    t.boolean  "confirmed"
  end

  add_index "friendships", ["friend_id"], name: "index_friendships_on_friend_id"
  add_index "friendships", ["student_id"], name: "index_friendships_on_student_id"

  create_table "likes", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "likeable_id"
    t.string   "likeable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "likes", ["student_id"], name: "index_likes_on_student_id"

  create_table "questions", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
  end

  add_index "questions", ["student_id"], name: "index_questions_on_student_id"

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.text     "school_name"
    t.integer  "age"
    t.integer  "student_class"
    t.string   "board"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "subject_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "student_id"
  end

  add_index "subjects", ["student_id"], name: "index_subjects_on_student_id"

  create_table "topics", force: :cascade do |t|
    t.string   "topic_name"
    t.boolean  "topic_done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "subject_id"
  end

  add_index "topics", ["subject_id"], name: "index_topics_on_subject_id"

end
