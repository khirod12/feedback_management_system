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

ActiveRecord::Schema.define(version: 20170317121438) do

  create_table "comments", force: :cascade do |t|
    t.text     "comment_text"
    t.integer  "vote_count"
    t.integer  "feedback_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["feedback_id"], name: "index_comments_on_feedback_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string   "project_name"
    t.string   "app_name"
    t.string   "app_comp"
    t.string   "feedback_title"
    t.text     "feedback_desc"
    t.binary   "screenshot"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "email"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "auth_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "user_type"
    t.string   "customer_name"
  end

end
