# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_10_03_091025) do
  create_schema "auth"
  create_schema "extensions"
  create_schema "graphql"
  create_schema "graphql_public"
  create_schema "pgbouncer"
  create_schema "realtime"
  create_schema "storage"
  create_schema "vault"

  # These are extensions that must be enabled in order to support this database
  enable_extension "extensions.pg_stat_statements"
  enable_extension "extensions.pgcrypto"
  enable_extension "extensions.uuid-ossp"
  enable_extension "graphql.pg_graphql"
  enable_extension "pg_catalog.plpgsql"
  enable_extension "vault.supabase_vault"

  create_table "matches", force: :cascade do |t|
    t.integer "winner_id", null: false
    t.integer "runner_up_id", null: false
    t.integer "second_runner_up_id", null: false
    t.integer "last_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["last_id"], name: "index_matches_on_last_id"
    t.index ["runner_up_id"], name: "index_matches_on_runner_up_id"
    t.index ["second_runner_up_id"], name: "index_matches_on_second_runner_up_id"
    t.index ["winner_id"], name: "index_matches_on_winner_id"
  end

  create_table "player_matches", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "match_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_player_matches_on_match_id"
    t.index ["player_id"], name: "index_player_matches_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "total_win"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "matches", "players", column: "last_id"
  add_foreign_key "matches", "players", column: "runner_up_id"
  add_foreign_key "matches", "players", column: "second_runner_up_id"
  add_foreign_key "matches", "players", column: "winner_id"
  add_foreign_key "player_matches", "matches"
  add_foreign_key "player_matches", "players"
end
