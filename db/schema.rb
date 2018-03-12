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

ActiveRecord::Schema.define(version: 20180312174640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_departments_on_ancestry"
  end

  create_table "directions", force: :cascade do |t|
    t.string "name", null: false
    t.integer "status", null: false
    t.date "receive_date", null: false
    t.date "nominated_date_end", null: false
    t.date "finish_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.integer "type"
    t.bigint "task_id"
    t.bigint "direction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "doc_file_name"
    t.string "doc_content_type"
    t.integer "doc_file_size"
    t.datetime "doc_updated_at"
    t.index ["direction_id"], name: "index_documents_on_direction_id"
    t.index ["task_id"], name: "index_documents_on_task_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "second_name"
    t.date "birthday", null: false
    t.string "passport"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_departments", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_post_departments_on_department_id"
    t.index ["post_id", "department_id"], name: "index_post_departments_for_uniqueness_relations_post_department", unique: true
    t.index ["post_id"], name: "index_post_departments_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_workers", force: :cascade do |t|
    t.integer "status", null: false
    t.integer "answer", null: false
    t.text "comment", null: false
    t.datetime "receive_date", null: false
    t.datetime "finish_date"
    t.bigint "worker_id"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_task_workers_on_task_id"
    t.index ["worker_id"], name: "index_task_workers_on_worker_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.text "description", null: false
    t.integer "status", null: false
    t.bigint "direction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_tasks_on_ancestry"
    t.index ["direction_id"], name: "index_tasks_on_direction_id"
  end

  create_table "workers", force: :cascade do |t|
    t.date "contract_start_date", null: false
    t.date "contract_end_date", null: false
    t.integer "status", null: false
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "post_department_id"
    t.index ["person_id"], name: "index_workers_on_person_id"
    t.index ["post_department_id"], name: "index_workers_on_post_department_id"
  end

  add_foreign_key "documents", "directions"
  add_foreign_key "documents", "tasks"
  add_foreign_key "post_departments", "departments"
  add_foreign_key "post_departments", "posts"
  add_foreign_key "task_workers", "tasks"
  add_foreign_key "task_workers", "workers"
  add_foreign_key "tasks", "directions"
  add_foreign_key "workers", "people"
end
