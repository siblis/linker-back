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

ActiveRecord::Schema.define(version: 2018_11_07_154556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", comment: "Collections table", force: :cascade do |t|
    t.string "name", comment: "Collections`s name"
    t.text "url", comment: "Collection`s url"
    t.text "comment", comment: "Comment to collection"
    t.bigint "user_id", comment: "Collection belongs to user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "links", comment: "Links table", force: :cascade do |t|
    t.string "name", comment: "Link`s name"
    t.text "url", comment: "Link`s url"
    t.text "comment", comment: "Comment to link"
    t.bigint "collection_id", comment: "Link belongs to collection"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_links_on_collection_id"
  end

  create_table "users", comment: "Users table", force: :cascade do |t|
    t.string "login", comment: "User`s login"
    t.string "password", comment: "User`s password"
    t.string "name", comment: "User`s name"
    t.string "email", comment: "User`s email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login"], name: "index_users_on_login", unique: true, comment: "Index used to lookup user by login"
  end

  add_foreign_key "collections", "users"
  add_foreign_key "links", "collections"
end
