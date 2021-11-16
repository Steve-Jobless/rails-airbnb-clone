# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cleaning the db..."
Space.destroy_all


puts 'Creating 10 Users...'
10.times do
  User.create!(
    email:Faker::Internet.email,
    password: "123123"
  )
end
puts "...created #{User.count} users"

puts 'Creating 10 Spaces...'
10.times do
  file = URI.open('https://cdn01.buxtonco.com/news/2009/istock-531360369__large.jpg')
  space = Space.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    category: Space::CATEGORIES.sample,
    description: "Ipsum lorem",
    size: 100,
    price: 1000,
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
