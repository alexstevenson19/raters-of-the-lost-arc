Genre.delete_all
User.delete_all
Film.delete_all

genre_names = ["Sci-Fi", "Comedy", "Documentary", "Action"]
genres = genre_names.each.map do |genre|
  Genre.create!(name: genre)
end

films = 10.times.map do
  Film.create!(title: Faker::Space.galaxy + " " + Faker::Superhero.name,release_year: Time.now.year - rand(1..50), description: Faker::Hipster.paragraph(2))
end
films.each do |film|
  2.times {film.film_genres << FilmGenre.create!(genre_id: genres.sample.id, film_id: film.id)}
end

user_ids = [1, 2, 3]
reviews = 20.times.map do
  Review.create!(reviewer_id: user_ids.sample,
                reviewable_type: 'Film',
                reviewable_id: user_ids.sample,
                stars: rand(1..5),
                headline: Faker::Hipster.sentence(3),
                content: Faker::Hipster.paragraphs.join(" "))
end

User.create!(username: "dave", email: "dave@davecorp.com", password: "dave")
User.create!(username: "bob", email: "bob@bob.bob", password: "password")
User.create!(username: "jen", email: "jen@jen.jen", password: "password")
