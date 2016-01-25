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

ActiveRecord::Schema.define(version: 20160125175444) do

  create_table "personalities", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "quiz_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "low_range"
    t.integer  "high_range"
  end

  add_index "personalities", ["quiz_id"], name: "index_personalities_on_quiz_id"

  create_table "questions", force: :cascade do |t|
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quiz_id"
  end

  add_index "questions", ["quiz_id"], name: "index_questions_on_quiz_id"

  create_table "quiz_options", force: :cascade do |t|
    t.string   "content"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "question_id"
    t.integer  "personality_id"
    t.integer  "points"
  end

  add_index "quiz_options", ["personality_id"], name: "index_quiz_options_on_personality_id"
  add_index "quiz_options", ["question_id"], name: "index_quiz_options_on_question_id"

  create_table "quizzes", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "user_results", force: :cascade do |t|
    t.integer  "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "quiz_id"
  end

  add_index "user_results", ["quiz_id"], name: "index_user_results_on_quiz_id"
  add_index "user_results", ["user_id"], name: "index_user_results_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
