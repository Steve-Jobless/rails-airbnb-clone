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
  # file = URI.open("http://source.unsplash.com/featured/?person&#{rand(10..1000)}")
  # user =
  User.create!(
    email:Faker::Internet.email,
    password: "123123",
    name: Faker::Hipster.word,
  )
  # user.photo.attach(io: file, filename: 'space.png', content_type: 'image/png')
end
puts "...created #{User.count} users"

puts 'Creating 20 Spaces...'
20.times do |i|
  file = URI.open("http://source.unsplash.com/featured/?#{Space::CATEGORIES.sample}&#{rand(1000)}")
  space = Space.create!(
    name: Faker::Hipster.word,
    address: Space::TENTATIVE_ADDRESSES[i],
    category: Space::CATEGORIES.sample,
    description: Faker::Restaurant.description,
    size: rand(10..200),
    price: rand(800..10_000),
    user: User.first,
    neighborhood: Space::TENTATIVE_NEIGHB_MESSAGES.sample,
    safety_note: Space::SAFETY_NOTE.sample,
    amenities: Space::AMENITIES.sample
  )
  # Active records requires this specfic format.
  space.photos.attach(io: file, filename: 'space.png', content_type: 'image/png')
end
puts "...created #{Space.count} spaces"

created_space = Space.count
puts "...created #{created_space} spaces"
puts 'Creating additional Spaces for fun...'

6.times do |i|
  category = Space::CATEGORIES.sample
  space = Space.create!(
    category: category,
    name: ["Famous horse sausage #{category}", "Eccentric #{category}", "#{category} Supernova", "#{category} Mai+", "#{category} La vie", "Hot #{category}"][i],
    address: Space::MEGURO_ADDRESSES[i],
    description: Faker::Restaurant.description,
    size: rand(10..200),
    price: rand(800..10_000),
    user: User.all.sample,
    neighborhood: Space::TENTATIVE_NEIGHB_MESSAGES.sample,
    safety_note: Space::SAFETY_NOTE.sample,
    amenities: Space::AMENITIES.sample
  )
  file = URI.open("http://source.unsplash.com/featured/?#{space.category}&#{rand(1000)}")
  space.photos.attach(io: file, filename: 'space.png', content_type: 'image/png')
end

addtional_space = Space.count - created_space
puts "...created #{addtional_space} additional spaces"

impact_hub = Space.create!(
    category: "cafe",
    name: "Impact Hub Coffe Space",
    address: "Meguro 2-１−3, Tokyo",
    description: "Impact HUB Tokyo is more than a mere place to work. We have a lot of entrepreneurs and creative minds at our space, working hard and needing coffee. Due to the limited staff availability, we close our cafe every Wednesday and our space is for you to rent.",
    size: 50,
    price: 5_000,
    user: User.first,
    neighborhood: Space::TENTATIVE_NEIGHB_MESSAGES.sample,
    safety_note: Space::SAFETY_NOTE.sample,
    amenities: Space::AMENITIES.sample
  )
  file = URI.open("https://lh5.googleusercontent.com/p/AF1QipMNPCA8ikLeatZ9_zzw1A0QxUkTXhGT70jVIUrq=w408-h271-k-no")
  impact_hub.photos.attach(io: file, filename: 'space.png', content_type: 'image/png')

# puts 'Creating 10 Booking...'
# Space.all.each do |space|
#   Booking.create!(
#   start_date: Date.today,
#   end_date: Date.today + 1,
#   status: Booking.statuses.keys.sample,
#   user: User.all.sample,
#   space: space
#   )
# end
# puts "...created #{Booking.count} booking"
