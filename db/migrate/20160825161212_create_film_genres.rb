class CreateFilmGenres < ActiveRecord::Migration
  def change
    create_table :film_genres do |t|
      t.integer :film_id
      t.integer :genre_id
    end
  end
end
