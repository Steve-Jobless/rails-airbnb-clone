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
    password: "123123"
  )
end
puts "...created #{User.count} users"

puts 'Creating 10 Spaces...'
10.times do |i|
  file = URI.open("http://source.unsplash.com/featured/?#{Space::CATEGORIES.sample}&#{rand(1000)}")
  space = Space.create!(
    name: Faker::Hipster.word,
    address: Space::TENTATIVE_ADDRESSES[i],
    category: Space::CATEGORIES.sample,
    description: Faker::Restaurant.description[0..20],
    size: rand(10..200),
    price: rand(800..10_000),
    user: User.first,
    neighborhood: Space::TENTATIVE_NEIGHB_MESSAGES.sample,
    safety_note: Space::SAFETY_NOTE.sample,
    amenities: Space::AMENITIES.sample

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
