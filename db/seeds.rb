# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Film.delete_all

films = 10.times.map do
  Film.create!(genre_id: 1,
              title: Faker::Space.galaxy + " " + Faker::Superhero.name,
              release_year: Time.now.year - rand(1..50),
              description: Faker::Hipster.paragraph(2))
end

User.delete_all

User.create!(username: "dave", email: "dave@davecorp.com", password: "dave")
User.create!(username: "bob", email: "bob@bob.bob", password: "password")
User.create!(username: "jen", email: "jen@jen.jen", password: "password")

