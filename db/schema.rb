# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_08_210937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.bigint "post_id", null: false
    t.bigint "commenter_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "vote_tally"
    t.index ["commenter_id"], name: "index_comments_on_commenter_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "poster_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "poster_name"
    t.string "mood_rating"
    t.string "mood_length"
    t.string "mood_location"
    t.string "mood_trigger"
    t.string "mood_trigger_detail"
    t.string "mood_description"
    t.string "mood_purpose"
    t.string "mood_title"
    t.string "mood_category"
    t.string "mood_category_detail"
    t.index ["poster_id"], name: "index_posts_on_poster_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "age"
    t.string "gender"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "voter_id", null: false
    t.bigint "comment_id", null: false
    t.boolean "upvote"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_votes_on_comment_id"
    t.index ["voter_id"], name: "index_votes_on_voter_id"
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users", column: "commenter_id"
  add_foreign_key "posts", "users", column: "poster_id"
  add_foreign_key "votes", "comments"
  add_foreign_key "votes", "users", column: "voter_id"
end
