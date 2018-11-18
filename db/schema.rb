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

ActiveRecord::Schema.define(version: 20_181_117_145_355) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'collections', comment: 'Collections table', force: :cascade do |t|
    t.string 'name', comment: 'Collections`s name'
    t.text 'url', comment: 'Collection`s url'
    t.text 'comment', comment: 'Comment to collection'
    t.bigint 'user_id', comment: 'Collection belongs to user'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_collections_on_user_id'
  end

  create_table 'links', comment: 'Links table', force: :cascade do |t|
    t.string 'name', comment: 'Link`s name'
    t.text 'url', comment: 'Link`s url'
    t.text 'comment', comment: 'Comment to link'
    t.bigint 'collection_id', comment: 'Link belongs to collection'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['collection_id'], name: 'index_links_on_collection_id'
  end

  create_table 'users', comment: 'Users table', force: :cascade do |t|
    t.string 'login', comment: 'User`s login'
    t.string 'password', comment: 'User`s password'
    t.string 'name', comment: 'User`s name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'authentication_token'
    t.index ['authentication_token'], name: 'index_users_on_authentication_token'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'collections', 'users'
  add_foreign_key 'links', 'collections'
end
