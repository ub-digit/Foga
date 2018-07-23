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

ActiveRecord::Schema.define(version: 20180723080116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "help_infos", force: :cascade do |t|
    t.text "helptext"
    t.string "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operations", force: :cascade do |t|
    t.string "operation_type", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operation_type"], name: "index_operations_on_operation_type", unique: true
  end

  create_table "post_infos", force: :cascade do |t|
    t.string "title", null: false
    t.string "issn"
    t.string "created_by", null: false
    t.string "updated_by", null: false
    t.string "publisher"
    t.text "comment"
    t.integer "operation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_post_infos_on_title", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "xname"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin", default: false
    t.string "name"
    t.boolean "is_active", default: true
  end

end
