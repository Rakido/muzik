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
  avatar: File.open(Rails.root.join("db/fixtures/users/avatar_haydar.jpg"))
  )

anatole = User.create(
  email: "anatole.gonon@gmail.com",
  password: "123456",
  first_name: "Anatole",
  last_name: "Gonon",
  phone_number: "0635458937",
  avatar: File.open(Rails.root.join("db/fixtures/users/avatar_anatole.jpg"))
  )

guitare = Instrument.create(
  user: haydar,
  city: "nantes",
  category: "Guitare",
  name: "Guitare Gibson sg standar",
  description: "Superbe Gibson, peu utilisée. Son magique.",
  photo: File.open(Rails.root.join("db/fixtures/instruments/haydar_instrument.jpg")),
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
    avatar: File.open(Rails.root.join("db/fixtures/users/hendrix_avatar.jpg"))
    )

  category = Instrument::CATEGORIES.sample

  Instrument.create!(
    user: user,
    city: Faker::Address.city,
    category: category,
    name: Faker::Lorem.sentence[0, 50],
    description: Faker::Lorem.sentence,
    price: (5..100).to_a.sample,
    available: true,
    photo: File.open(Rails.root.join("db/fixtures/instruments/#{category.parameterize}.jpg"))
  )
end

puts 'Finished!'
