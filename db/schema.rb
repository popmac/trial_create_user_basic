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

ActiveRecord::Schema.define(version: 20170313091118) do

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                                     null: false
    t.text     "body",        limit: 65535,                 null: false
    t.datetime "released_at",                               null: false
    t.datetime "expired_at"
    t.boolean  "member_only",               default: false, null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "entries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "member_id",                                  null: false
    t.string   "title",                                      null: false
    t.text     "body",       limit: 65535
    t.datetime "posted_at",                                  null: false
    t.string   "status",                   default: "draft", null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["member_id"], name: "index_entries_on_member_id", using: :btree
  end

  create_table "member_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "member_id",                  null: false
    t.binary   "data",         limit: 65535
    t.string   "content_type"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["member_id"], name: "index_member_images_on_member_id", using: :btree
  end

  create_table "members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "number",                          null: false
    t.string   "name",                            null: false
    t.string   "full_name"
    t.string   "email"
    t.date     "birthday"
    t.integer  "gender",          default: 0,     null: false
    t.boolean  "administrator",   default: false, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "hashed_password"
  end

end
