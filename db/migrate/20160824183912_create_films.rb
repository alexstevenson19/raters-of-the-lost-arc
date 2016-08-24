class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.integer :genre_id, null: false
      t.string :title, null: false
      t.integer :release_year, null: false
      t.text :description, null: false

      t.timestamps(null: false)
    end
  end
end
