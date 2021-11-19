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

# puts 'Creating 5 random Users...'
# 5.times do

#   User.create!(
#     email:Faker::Internet.email,
#     password: "123123",
#     name: Faker::Hipster.word,
#   )
# file = URI.open("https://cdn-japantimes.com/wp-content/uploads/2020/06/Sylvain-Pierre-ok.jpg")
# User.avatar.attach(io: file, filename: 'avatar.png', content_type: 'image/png')
# end

random_user_count = User.count
puts "...created #{random_user_count} random users"

puts 'Creating 5 realistic Users...'
sylvain = User.create!(
  email: "sylvain@email.com",
  password: "123123",
  name: "Sylvain Pierre"
)

file = URI.open("https://cdn-japantimes.com/wp-content/uploads/2020/06/Sylvain-Pierre-ok.jpg")
sylvain.avatar.attach(io: file, filename: 'person.png', content_type: 'image/png')

doug = User.create!(
  email:"doug@email.com",
  password: "123123",
  name: "Douglas Berkeley"
)
file = URI.open("https://avatars.githubusercontent.com/u/25542223?v=4")
doug.avatar.attach(io: file, filename: 'person.png', content_type: 'image/png')

yann = User.create!(
  email:Faker::Internet.email,
  password: "123123",
  name: "Yann Klein"
)
file = URI.open("https://miro.medium.com/max/1000/1*11P3G0mpTUp6PqhgkZ5CeA.jpeg")
yann.avatar.attach(io: file, filename: 'person.png', content_type: 'image/png')

noemi = User.create!(
  email:Faker::Internet.email,
  password: "123123",
  name: "Noemi Ashizuka"
)
file = URI.open("https://res.cloudinary.com/dtewjoisz/image/upload/v1591347934/website-resized/noemi_gipna1.png")
noemi.avatar.attach(io: file, filename: 'person.png', content_type: 'image/png')

sasha = User.create!(
  email:Faker::Internet.email,
  password: "123123",
  name: "Sasha Kaverina"
)
file = URI.open("https://media-exp1.licdn.com/dms/image/C5603AQGve1yT9wDP8g/profile-displayphoto-shrink_800_800/0/1598857424553?e=1642636800&v=beta&t=asOql9I7cXFftpoATzlp3q4R722JkXfZYWdJLk24s24
")
sasha.avatar.attach(io: file, filename: 'person.png', content_type: 'image/png')

puts "Created #{User.count - random_user_count} realistic Users..."

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
    user: User.all.sample,
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
