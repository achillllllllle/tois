# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_05_135335) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "toi_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["toi_id"], name: "index_bookmarks_on_toi_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friends", force: :cascade do |t|
    t.bigint "follower_id", null: false
    t.bigint "following_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id"], name: "index_friends_on_follower_id"
    t.index ["following_id"], name: "index_friends_on_following_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "photo"
    t.text "review"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.bigint "toi_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["toi_id"], name: "index_posts_on_toi_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "toi_artists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "artist_id"
    t.bigint "toi_id"
    t.index ["artist_id"], name: "index_toi_artists_on_artist_id"
    t.index ["toi_id"], name: "index_toi_artists_on_toi_id"
  end

  create_table "tois", force: :cascade do |t|
    t.string "title"
    t.bigint "category_id", null: false
    t.string "location"
    t.text "description"
    t.string "trailer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_tois_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "permitted", default: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookmarks", "tois"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "friends", "users", column: "follower_id"
  add_foreign_key "friends", "users", column: "following_id"
  add_foreign_key "posts", "tois"
  add_foreign_key "posts", "users"
  add_foreign_key "toi_artists", "artists"
  add_foreign_key "toi_artists", "tois"
  add_foreign_key "tois", "categories"
end
