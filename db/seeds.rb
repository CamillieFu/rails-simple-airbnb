# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'detroying all flats'
Flat.destroy_all
puts 'destroyed all flats'
puts 'creating new flats ... '
10.times do
  Flat.create(
    name: Faker::Fantasy::Tolkien.poem,
    address: Faker::Movies::Hobbit.location,
    description: "A lovely summer feel for this spacious garden flat. #{rand(2..4)} bedrooms, open plan living area, large kitchen and a beautiful #{["library,", "kitchen", "pool"].sample}",
    price_per_night: rand(75..250),
    number_of_guests: rand(1..5)
  )
end
puts 'completed flats'
