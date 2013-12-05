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

ActiveRecord::Schema.define(version: 20131204230557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "playlist_orders", force: true do |t|
    t.integer  "order_num"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "song_id"
    t.integer  "playlist_id"
  end

  add_index "playlist_orders", ["playlist_id"], name: "index_playlist_orders_on_playlist_id", using: :btree
  add_index "playlist_orders", ["song_id"], name: "index_playlist_orders_on_song_id", using: :btree

  create_table "playlist_permissions", force: true do |t|
    t.text     "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "playlist_id"
  end

  add_index "playlist_permissions", ["playlist_id"], name: "index_playlist_permissions_on_playlist_id", using: :btree
  add_index "playlist_permissions", ["user_id"], name: "index_playlist_permissions_on_user_id", using: :btree

  create_table "playlists", force: true do |t|
    t.string   "name",       default: "Untitled Playlist"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: true do |t|
    t.text    "title",             default: "Untitled"
    t.text    "artist",            default: "Untitled"
    t.text    "url"
    t.text    "source",            default: "SoundCloud"
    t.text    "album",             default: "Untitled"
    t.integer "plays"
    t.integer "shares"
    t.integer "favorites"
    t.string  "remote_creator_id"
    t.string  "duration"
    t.text    "stream_id"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.text     "first_name"
    t.text     "last_name"
    t.text     "zip"
    t.text     "image",            default: "http://s3.amazonaws.com/ApolloApp/Landing+Page/blank_avatar.png"
    t.string   "password_digest"
    t.string   "password_salt"
    t.string   "sc_access_token"
    t.string   "sc_expiration"
    t.string   "sc_refresh_token"
    t.string   "auth_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
