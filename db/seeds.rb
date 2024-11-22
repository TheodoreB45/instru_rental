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
  { name: "Guitar", image_url: ["https://cdn.pixabay.com/photo/2010/12/13/10/01/guitar-2119_640.jpg", "https://media.istockphoto.com/id/1390883286/photo/young-man-playing-guitar-at-home.jpg?s=612x612&w=0&k=20&c=HhSU8oNuz17UyoALdek5x0TDk7ERI4KSd6VOAczIYSY=", "https://media.istockphoto.com/id/1279051218/photo/portrait-of-senior-musician-with-electric-guitar.jpg?s=612x612&w=0&k=20&c=3ShQnOohQ99ucpoVQF_iElV3XoGLPXHcTnSLef79C20=", "https://media.istockphoto.com/id/2153741332/photo/new-melody-inspired-guitarist-hobby-man-notes-home.jpg?s=612x612&w=0&k=20&c=GWgFXHvyXD9o2PSagpZNHdHP3cD_xYndRwgxR_B-mIA="] },
  { name: "Clarinet", image_url: ["https://media.istockphoto.com/id/524196373/vector/clarinet.jpg?s=612x612&w=0&k=20&c=WHom-vbabw6IZaoCTB7S1ThtwRZ3RmTDamGiOnUN880=", "https://media.istockphoto.com/id/2027744490/photo/male-hands-sticking-out-blue-background-with-clarinet-music-therapy-sessions-advertisement.jpg?s=612x612&w=0&k=20&c=xFcCVrVWQVFmzrL8l35idSziYU6d4Oh-5zqBM1TiwNI=", "https://media.istockphoto.com/id/1132784158/photo/playing-clarinet.jpg?s=612x612&w=0&k=20&c=VhXK4VoRWMvWkDacLmtfpre-76uN2QIz2FQMGQdI3gk="] },
  { name: "Piano", image_url: ["https://media.istockphoto.com/id/1086201392/photo/plan.jpg?s=612x612&w=0&k=20&c=wWC9atQySAosH8nlvwspv2LJjrKTFhE3jPd7i8KAPMw=", "https://media.istockphoto.com/id/480652459/photo/black-grand-piano-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=HA3-PzcFl6Yd-d1s1tVrgWT_hOz5zyjcd1OhjoVduE0=", "https://media.istockphoto.com/id/1141157035/photo/loft-interior-piano-concept.jpg?s=612x612&w=0&k=20&c=z6bfGIqb2RXeiRlRmSDnr65F_8_2kQIzhGEJgHQY34E=", "https://media.istockphoto.com/id/913633338/photo/black-grand-piano-in-empty-room.jpg?s=612x612&w=0&k=20&c=opxK5xaoOI4APX66-y2MaHJrGnrh8qcbbW8InQTH0M8="] },
  { name: "Saxophone", image_url: ["https://media.istockphoto.com/id/1705803657/photo/teenage-boy-play-saxophone-at-home.jpg?s=612x612&w=0&k=20&c=UdMireToRO5x1IPYUhwXqJp21nTzKx3s_5iBmwZb7CI=", "https://media.istockphoto.com/id/1758812473/photo/full-length-profile-shot-of-a-mature-male-musician-playing-a-sax.jpg?s=612x612&w=0&k=20&c=e9i2NT7CP8iA845Ibui-YzvvLxZp19hOZRYaginaT18=", "https://media.istockphoto.com/id/1272809276/photo/the-saxophone-player.jpg?s=612x612&w=0&k=20&c=5u25fqwrgAaFzJR1g3OrrLF7MHCY_VMXC70olpqNTIg=", "https://media.istockphoto.com/id/517187174/photo/young-musician.jpg?s=612x612&w=0&k=20&c=5JmqAGzObqrcT-EH__x4GyXASzArrh4ffzghpFdvyb0="] }
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

    instrument.save!
    puts "#{i.title} created!"
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
