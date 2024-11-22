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


instruments = [
  { name: "Guitar", image_url: ["data:image/jpeg;base64,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", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ36oHVA7cvRkxic5GEnfu-UalvXkq7CxJotA&s"] },
  { name: "Clarinet", image_url: [""] },
  { name: "Piano", image_url: [""] },
  { name: "Saxophone", image_url: [""] }
]

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
  instruments.each do |i|
    instrument = Instrument.new(
      title: i[:name],
      condition: conditions.sample,
      description: descriptions.sample,
      address: Faker::Address.street_address + ", London, " + Faker::Address.postcode,
      user: user1
    )
    file = URI.parse(i[:image_url].sample).open
    instrument.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    instrument.save

    instrument.save!
  end
end

puts "Instrument Created: #{Instrument.count}"


puts "Creating Bookings"

10.times do

  booking = Booking.new(
    user: User.all.sample,
    instrument: Instrument.all.sample,
    start_date: "Mon, 25 Nov 2024",
    end_date: "Wed, 27 Nov 2024"
  )
    booking.save!
end
puts "Bookings Created..."
