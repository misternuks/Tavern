# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Warming the syrup...'
DmProfile.destroy_all
User.destroy_all

puts 'Contacting Dr. Gemima...'
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: "123456"
  )
end
puts 'Oh my god, my waffle!'

# DM Profiles
puts "ROUND 2: FIGHT!"
puts 'Warming the syrup 2...'

puts 'Contacting Dr. Gemima 2...'
5.times do
  DmProfile.create!(
    price: rand(1..10),
    experience: Faker::Quote.mitch_hedberg,
    availability: %i[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].sample(rand(1..4)).to_sentence,
    user_id: User.all.to_a.sample.id
  )
end
puts 'Oh my god, my waffle 2!'
