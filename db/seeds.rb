require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cleaning database..."
User.destroy_all
# Event.destroy_all
# Booking.destroy_all


puts "Creating users..."

sports = ["Tennis", "Baseball", "Soccer", "Badminton", "Rugby", "Swimming", "Running", "Volleyball"]
language = ["French", "English", "German", "Portugese", "Spanish"]
gender = ["Male", "Female"]


50.times do
user = User.new(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name:Faker::Name.last_name , age: rand(20..60), gender: gender.sample, language: language.sample, favorite_sport: sports.sample, description: Faker::Lorem.paragraph, skill_level: rand(0..5), password: "123456")
user.save!
end

puts "Creating events..."

50.times do
event = Event.new(sport: sports.sample, date: Faker::Date.between(from: '2020-09-01', to: '2020-09-05') , start_time: "", end_time: "", location: Faker::Address.city, address: Faker::Address.full_address, longitude: Faker::Address.longitude, latitude:Faker::Address.latitude, organizer_id: rand(1..15))
event.save!
end

puts "Creating bookings..."

50.times do
booking = Booking.new(event_id: rand(1..50), participant_id: rand(16..50))
booking.save!
end


puts "Finished!"
