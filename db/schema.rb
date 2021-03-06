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

ActiveRecord::Schema.define(version: 20170605130141) do

  create_table "cabs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "color"
    t.boolean  "available",  default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["color"], name: "index_cabs_on_color", using: :btree
  end

  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal  "latitude",       precision: 5, scale: 2, null: false
    t.decimal  "longitude",      precision: 5, scale: 2, null: false
    t.string   "locatable_type"
    t.integer  "locatable_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["locatable_type", "locatable_id"], name: "index_locations_on_locatable_type_and_locatable_id", using: :btree
  end

  create_table "rides", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "cab_id",                                        null: false
    t.integer  "user_id",                                       null: false
    t.decimal  "fare",       precision: 10
    t.string   "status",                    default: "started"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean  "hipster",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
