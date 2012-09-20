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

ActiveRecord::Schema.define(:version => 20120920085335) do

  create_table "bollywood_news", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.string   "data_url"
    t.string   "category"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "bollywood_previews", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "data_url"
    t.string   "image_url"
    t.string   "category"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "bollywood_reviews", :force => true do |t|
    t.string   "title"
    t.string   "mini_description"
    t.text     "description"
    t.string   "thumb_url"
    t.string   "image_url"
    t.integer  "rating"
    t.string   "data_url"
    t.string   "category"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "bollywood_trailers", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "thumb_url"
    t.string   "data_url"
    t.string   "video_url"
    t.string   "category"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
