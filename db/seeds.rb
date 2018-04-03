# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Reservation.destroy_all
Instrument.destroy_all
User.destroy_all

puts 'Creating static users with their instruments / reservations...'
haydar = User.create(
  email: "tknhaydar@gmail.com",
  password: "123456",
  first_name: "Haydar",
  last_name: "Taskin",
  phone_number: "0635458936",
  # avatar:""
  )

anatole = User.create(
  email: "anatole.gonon@gmail.com",
  password: "123456",
  first_name: "Anatole",
  last_name: "Gonon",
  phone_number: "0635458937",
  # avatar:""
  )

guitare = Instrument.create(
  user: haydar,
  city: "nantes",
  category: "Guitare",
  name: "Guitare Gibson sg standar",
  description: "Superbe Gibson, peu utilisée. Son magique.",
  # photo: "",
  price: 5,
  available: true,
  )

reservation_1 = Reservation.create(
  user: anatole,
  instrument: guitare,
  message: "Bonjour, j'aimerais louer votre guitare gibson dans le cadre d'un mariage.",
  start_date: "2018-04-05",
  end_date: "2018-04-08",
  total_price: 15,
  status: "pending",
  )


puts 'Creating fake users and instruments...'
10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: ['1234567', "12345678", "123456789"].sample,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.phone_number,
  )

  Instrument.create!(
    user: user,
    city: Faker::Address.city,
    category: Instrument::CATEGORIES.sample,
    name: Faker::Lorem.sentence[0, 50],
    description: Faker::Lorem.sentence,
    price: (5..100).to_a.sample,
    available: true,
  )
end

puts 'Finished!'
