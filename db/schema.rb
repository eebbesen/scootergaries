# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_25_035820) do

  create_table "cards", force: :cascade do |t|
    t.string "title"
    t.string "slot_1"
    t.string "slot_2"
    t.string "slot_3"
    t.string "slot_4"
    t.string "slot_5"
    t.string "slot_6"
    t.string "slot_7"
    t.string "slot_8"
    t.string "slot_9"
    t.string "slot_10"
    t.string "slot_11"
    t.string "slot_12"
    t.string "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "game_cards", force: :cascade do |t|
    t.integer "game_id"
    t.integer "card_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "game_player_cards", force: :cascade do |t|
    t.integer "player_id"
    t.string "slot_1"
    t.string "slot_2"
    t.string "slot_3"
    t.string "slot_4"
    t.string "slot_5"
    t.string "slot_6"
    t.string "slot_7"
    t.string "slot_8"
    t.string "slot_9"
    t.string "slot_10"
    t.string "slot_11"
    t.string "slot_12"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "card_id"
  end

  create_table "game_players", force: :cascade do |t|
    t.integer "game_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "session_id"
    t.string "name"
    t.boolean "active"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.string "locator"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active"
    t.integer "active_card_id"
  end

end
