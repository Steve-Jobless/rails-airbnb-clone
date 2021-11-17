# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cleaning the db..."
Booking.destroy_all
Space.destroy_all
User.destroy_all

puts 'Creating 10 Users...'
10.times do
  User.create!(
    email:Faker::Internet.email,
    password: "123123",
    name: Faker::Hipster.word,
  )
end
puts "...created #{User.count} users"

puts 'Creating 10 Spaces...'
10.times do
  file = URI.open('https://cdn01.buxtonco.com/news/2009/istock-531360369__large.jpg')
  space = Space.create!(
    name: Faker::Hipster.word,
    address: ["2 Chome-11-3 Meguro, Meguro City, Tokyo 153-0063", "5 Chome-24-2 Sendagaya, Shibuya City, Tokyo 151-8580", "1 Chome−７ Kanagawa, Yokohama, 225-0002", "1 Chome-22-6 Jinnan, Shibuya City, Tokyo 150-0041" ]
    category: Space::CATEGORIES.sample,
    description: "Ipsum lorem",
    size: [10..200].to_a.sample,
    price: [800..10_000].to_a.sample,
    user: User.first
  )
  # Active records requires this specfic format.
  space.photo.attach(io: file, filename: 'space.png', content_type: 'image/png')
end
puts "...created #{Space.count} spaces"


puts 'Creating 10 Booking...'
Space.all.each do |space|
  Booking.create!(
  start_date: Date.today,
  end_date: Date.today + 1,
  status: Booking.statuses.keys.sample,
  user: User.all.sample,
  space: space
  )
end
puts "...created #{Booking.count} booking"
