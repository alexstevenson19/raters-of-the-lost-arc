Genre.delete_all
User.delete_all
Film.delete_all

genre_names = ["Sci-Fi", "Comedy", "Documentary", "Action"]
genres = genre_names.each.map do |genre|
  Genre.create!(name: genre)
end

films = 10.times.map do
  Film.new(title: Faker::Space.galaxy + " " + Faker::Superhero.name,release_year: Time.now.year - rand(1..50), description: Faker::Hipster.paragraph(2))
end

genre_ids = [1, 2, 3, 4]
films.each do |film|

  2.times do
    a = FilmGenre.create!(genre_id: genre_ids.sample, film_id: film.id)
    film.film_genres << a
  end
  film.save
end

Film.create(title: "Jaws", release_year: 1975, description: "When a gigantic great white shark begins to menace the small island community of Amity, a police chief, a marine scientist and a grizzled fisherman set out to stop it.")
FilmGenre.create(genre_id: 4, film_id: Film.all.last)

Film.create(title: "Brazil", release_year: 1985, description: "A bureaucrat in a retro-future world tries to correct an administrative error and himself becomes an enemy of the state.")
FilmGenre.create(genre_id: 1, film_id: Film.all.last)


Film.create(title: "There Will Be Blood", release_year: 2007, description: "A story of family, religion, hatred, oil and madness, focusing on a turn-of-the-century prospector in the early days of the business.")
FilmGenre.create(genre_id: 2, film_id: Film.all.last)


User.delete_all
user_ids = [1, 2, 3]

reviews = 20.times.map do
  Review.create!(reviewer_id: user_ids.sample,
                reviewable_type: 'Film',
                reviewable_id: Film.all.sample.id,
                stars: rand(1..5),
                headline: Faker::Hipster.sentence(3),
                content: Faker::Hipster.paragraphs.join(" "))
end

User.create!(username: "dave", email: "dave@davecorp.com", password: "dave")
User.create!(username: "bob", email: "bob@bob.bob", password: "password")
User.create!(username: "jen", email: "jen@jen.jen", password: "password")


Comment.delete_all
Comment.create!(commenter_id: rand(1..User.all.count), commentable_type: "film", commentable_id: rand(1..Film.all.count), body: Faker::Hipster.sentence)
