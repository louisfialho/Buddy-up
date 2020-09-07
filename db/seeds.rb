require 'faker'
require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cleaning database..."

Message.destroy_all
Chatroom.destroy_all
Booking.destroy_all
Event.destroy_all
User.destroy_all


puts "Creating users..."

sports = ["Tennis", "Baseball", "Soccer", "Badminton", "Rugby", "Swimming", "Running", "Volleyball"]
language = ["French", "English", "German", "Portugese", "Spanish"]
gender = ["Male", "Female"]
cities = ["Lisbon", "Paris", "London"]


4.times do
user = User.new(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name:Faker::Name.last_name , age: rand(20..60), gender: gender.sample, language: language.sample, favorite_sport: sports.sample, description: Faker::Lorem.paragraph, skill_level: rand(1..5), password: "123456", nickname: Faker::Artist.name)
user.save!
end

puts "Creating events..."


6.times do
file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
start = Faker::Time.between(from: DateTime.now + rand(5..10).hours, to: DateTime.now + 168.hours)
endtime = start + rand(0..3).hours
event = Event.new(sport: sports.sample, start_time: start, end_time: endtime, address: "132 Rue de Turenne 75003", organizer_id: User.all.sample.id)
event.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
event.save!
end

puts "Creating bookings..."

6.times do
booking = Booking.new(event_id: Event.all.sample.id, participant_id: User.all.sample.id)
booking.save!
end

puts "Creating channels..."

6.times do
chatroom = Chatroom.new(name: Faker::IDNumber.valid)
chatroom.save!
end


puts "Finished!"
