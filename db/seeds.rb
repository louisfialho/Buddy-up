require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cleaning database..."

Booking.destroy_all
Event.destroy_all
User.destroy_all


puts "Creating users..."

sports = ["Tennis", "Baseball", "Soccer", "Badminton", "Rugby", "Swimming", "Running", "Volleyball"]
language = ["French", "English", "German", "Portugese", "Spanish"]
gender = ["Male", "Female"]
cities = ["Lisbon", "Paris", "London"]


60.times do
user = User.new(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name:Faker::Name.last_name , age: rand(20..60), gender: gender.sample, language: language.sample, favorite_sport: sports.sample, description: Faker::Lorem.paragraph, skill_level: rand(1..5), password: "123456")
user.save!
end

puts "Creating events..."


60.times do
start = Faker::Time.between(from: DateTime.now + rand(5..10).hours, to: DateTime.now + 168.hours)
endtime = start + rand(0..3).hours
event = Event.new(sport: sports.sample, start_time: start, end_time: endtime, location: cities.sample, address: Faker::Address.full_address, longitude: Faker::Address.longitude, latitude:Faker::Address.latitude, organizer_id: User.all.sample.id)
event.save!
end

puts "Creating bookings..."

60.times do
booking = Booking.new(event_id: Event.all.sample.id, participant_id: User.all.sample.id)
booking.save!
end


puts "Finished!"
