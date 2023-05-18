# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Warming the syrup...'
Booking.destroy_all
DmProfile.destroy_all
User.destroy_all

puts 'Contacting Dr. Gemima...'
count = 0
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    user_name: Faker::Internet.username
  )
  DmProfile.create!(
    price: rand(1..10),
    experience: Faker::Quote.mitch_hedberg,
    availability: %i[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].sample(rand(1..4)).to_sentence,
    user_id: User.last.id
  )
  puts count += 1
end
puts 'Oh my god, my waffle!'
