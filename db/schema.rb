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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130125025145) do

  create_table "blog_post_comments", :force => true do |t|
    t.integer  "blog_post_id",                 :default => 0,  :null => false
    t.string   "name",         :limit => 250,  :default => "", :null => false
    t.string   "comment",      :limit => 9000, :default => "", :null => false
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "email",        :limit => 250,  :default => "", :null => false
  end

  create_table "blog_post_taggings", :force => true do |t|
    t.integer  "blog_post_id",     :default => 0, :null => false
    t.integer  "blog_post_tag_id", :default => 0, :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "blog_post_tags", :force => true do |t|
    t.string   "name",       :limit => 250, :default => "", :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "blog_posts", :force => true do |t|
    t.string   "title",      :limit => 500,  :default => "", :null => false
    t.string   "author",     :limit => 250,  :default => "", :null => false
    t.string   "body",       :limit => 9000, :default => "", :null => false
    t.integer  "status",                     :default => 1,  :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "song_arrangement_files", :force => true do |t|
    t.integer  "song_id",                             :default => 0,  :null => false
    t.integer  "song_arrangement_id",                 :default => 0,  :null => false
    t.string   "title",               :limit => 500,  :default => "", :null => false
    t.string   "file_path",           :limit => 2000, :default => "", :null => false
    t.string   "description",         :limit => 9000, :default => "", :null => false
    t.string   "added_by",            :limit => 250
    t.string   "updated_by",          :limit => 250
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.string   "url",                 :limit => 500,  :default => ""
  end

  add_index "song_arrangement_files", ["title"], :name => "index_song_arrangement_files_on_title"

  create_table "song_arrangements", :force => true do |t|
    t.integer  "song_id",                       :default => 0,  :null => false
    t.string   "title",         :limit => 500,  :default => "", :null => false
    t.string   "notes",         :limit => 9000
    t.string   "chart_content", :limit => 9000
    t.string   "chart_mapping", :limit => 250
    t.string   "original_key",  :limit => 2
    t.integer  "bpm",                           :default => 0,  :null => false
    t.string   "added_by",      :limit => 250
    t.string   "updated_by",    :limit => 250
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  add_index "song_arrangements", ["bpm"], :name => "index_song_arrangements_on_bpm"
  add_index "song_arrangements", ["original_key"], :name => "index_song_arrangements_on_original_key"
  add_index "song_arrangements", ["title"], :name => "index_song_arrangements_on_title"

  create_table "songs", :force => true do |t|
    t.string   "title",      :limit => 500, :default => "", :null => false
    t.string   "artist",     :limit => 500, :default => "", :null => false
    t.string   "added_by",   :limit => 250
    t.string   "updated_by", :limit => 250
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "songs", ["artist"], :name => "index_songs_on_artist"
  add_index "songs", ["title"], :name => "index_songs_on_title"

  create_table "users", :force => true do |t|
    t.string   "name",                   :limit => 250
    t.string   "email",                  :limit => 250, :default => "",    :null => false
    t.string   "encrypted_password",                    :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.boolean  "admin",                                 :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
