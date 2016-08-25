Genre.delete_all
genre_names = ["Sci-Fi", "Comedy", "Documentary", "Action"]
genres = genre_names.each.map do |genre|
  Genre.create!(name: genre)
end

Film.delete_all
films = 10.times.map do
  Film.create!(genre_id: rand(1..genre_names.length),
              title: Faker::Space.galaxy + " " + Faker::Superhero.name,
              release_year: Time.now.year - rand(1..50),
              description: Faker::Hipster.paragraph(2))
end

User.delete_all

User.create!(username: "dave", email: "dave@davecorp.com", password: "dave")
User.create!(username: "bob", email: "bob@bob.bob", password: "password")
User.create!(username: "jen", email: "jen@jen.jen", password: "password")
