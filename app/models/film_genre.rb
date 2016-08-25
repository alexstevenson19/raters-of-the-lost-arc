class FilmGenre < ActiveRecord::Base
  belongs_to :film
  belongs_to :genre
end
