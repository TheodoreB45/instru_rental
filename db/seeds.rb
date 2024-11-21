# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

puts "Cleaning Database..."
Booking.destroy_all
Instrument.destroy_all
User.destroy_all


puts "Creating Users..."
user1 = User.new(
  email: "test@instrurental.com",
  password: "123123"
)
user1.save!
puts "User Created: #{User.count}"


conditions = ['New', 'Like New', 'Good', 'Okay', 'Bad', 'Road worn']
descriptions = [
  "This high-quality instrument is perfect for musicians at any skill level. With exceptional sound and build quality, it’s ready for your next performance or practice session.",
  "Available for rent, this instrument offers both versatility and reliability. Whether you're playing solo or in a group, it delivers a smooth, consistent sound every time.",
  "Looking for a professional-grade instrument for your next gig or rehearsal? This option provides the sound quality and durability you need, available for short or long-term rental.",
  "Rent this instrument to enhance your musical experience. Its easy playability and dynamic range make it a great choice for any performance or practice setting.",
  "A must-have for any serious musician, this instrument is designed for both comfort and performance. Rent it now for an event or ongoing practice sessions.",
  "Rent this well-crafted instrument, designed to deliver rich tones and exceptional responsiveness. Ideal for any level of musician looking for a dependable instrument for gigs or practice.",
  "This instrument is perfect for musicians who require portability without sacrificing sound quality. Whether you’re traveling for a performance or practicing at home, this is a great option.",
  "Whether you’re performing or practicing, this instrument offers a full range of sounds with ease. Available for rent, it’s the ideal choice for any musical situation.",
  "Rent this instrument to get the best of both quality and versatility. Perfect for a wide variety of musical styles, it's ready to perform when you are.",
  "This instrument combines exceptional craftsmanship and a rich, vibrant tone. Rent it for your next event, rehearsal, or performance and elevate your music to the next level."
]

puts "Creating Instruments..."
10.times do
  instrument = Instrument.new(
    title: Faker::Music.instrument,
    condition: conditions.sample,
    description: descriptions.sample,
    address: Faker::Address.street_address + ", London, " + Faker::Address.postcode,
    user: user1
  )

  instrument.save!
end

puts "Instrument Created: #{Instrument.count}"
