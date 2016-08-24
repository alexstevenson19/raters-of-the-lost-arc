
ActiveRecord::Schema.define(version: 20160824183912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "films", force: :cascade do |t|
    t.integer  "genre_id",     null: false
    t.string   "title",        null: false
    t.integer  "release_year", null: false
    t.text     "description",  null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
