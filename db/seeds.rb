puts 'Cleaning database...'
Reservation.destroy_all
Instrument.destroy_all
User.destroy_all

puts 'Creating static users with their instruments / reservations...'

# seed user
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

jj = User.create(
  email: "jjulien@gkombolo.ooo",
  password: "123456",
  first_name: "JJ",
  last_name: "Bernard ",
  phone_number: "0745678923",
  avatar: File.open(Rails.root.join("db/fixtures/users/avatar_jj.jpg")),
  )

simon = User.create(
  email: "simon@gmail.com",
  password: "123456",
  first_name: "Simon",
  last_name: "Lefebvre",
  phone_number: "0643567812",
  avatar: File.open(Rails.root.join("db/fixtures/users/avatar_simon.jpg"))
  )


# seed isntrument

guitare = Instrument.create(
  user: anatole,
  city: "Vannes",
  category: "Guitare",
  name: "Fender Stratocaster US American Deluxe 1998",
  description: "Je loue une Stratocaster American Deluxe de 1998.
  Les Noiseless d'origine ont été remplacés par des Lace Sensor Blue, Gold et Red, les mêmes que sur la Stratocaster Eric Clapton signature.
  Super son défini, clean, claquant mais aussi rond et sans bruits de fond.
  Corps en frêne, manche érable touche maple, plutôt fin. Les frettes sont en très bon état.
  Juste et bien réglée, la guitare tient parfaitement l'accord grâce à ses mécaniques auto-bloquante.",
  photo: File.open(Rails.root.join("db/fixtures/instruments/fender_guitare.jpg")),
  price: 7,
  available: true,
  )

violon = Instrument.create(
  user: simon,
  city: "Loudéac",
  category: "Violon",
  name: "Violon de formation",
  description: "Loue violon facile et agréable à jouer pour débuter!!!
  Très bon état. Ce violon n’est pas ancien.
  Les méthodes de lutherie récentes lui procurent une facilité de jeux avec un son clair et net",
  photo: File.open(Rails.root.join("db/fixtures/instruments/violon_etude.jpg")),
  price: 3,
  available: true,
  )

batterie = Instrument.create(
  user: haydar,
  city: "Nantes",
  category: "Batterie",
  name: "Batterie Yamaha - Livraison Disponible ",
  description: "Batterie Yamaha état neuf - Studio GIGMAKER Fusion 20'' Black Glitter + accessoires. Très peu servi, montée une seule fois.",
  photo: File.open(Rails.root.join("db/fixtures/instruments/batterie_yamaha.jpg")),
  price: 14,
  available: true,
  )

guitare_2 =
Instrument.create(
  user: haydar,
  city: "Nantes",
  category: "Guitare",
  name: "Guitare électrique Jim Harley",
  description: "Superbe guitare avec son de folie. Location longue durée acceptée.",
  photo: File.open(Rails.root.join("db/fixtures/instruments/guitare_2.jpg")),
  price: 4,
  available: true,
  )

guitare_3 =
Instrument.create(
  user: haydar,
  city: "Nantes",
  category: "Guitare",
  name: "Guitare électrique Vesper",
  description: "Je possède cette gratte depuis un moment et j'en suis ravi. Un bon point de départ pour se familiariser avec la musique.",
  photo: File.open(Rails.root.join("db/fixtures/instruments/guitare_3.jpg")),
  price: 5,
  available: true,
  )

cor_de_chasse = Instrument.create(
  user: jj,
  city: "Rennes",
  category: "Cor De Chasse",
  name: "Cor De Chasse",
  description: "Ce cor de chasse est idéale pour des chasses ponctuelles.",
  photo: File.open(Rails.root.join("db/fixtures/instruments/cor_de_chasse.jpg")),
  price: 2,
  available: true,
  )

piano = Instrument.create(
  user: jj,
  city: "Rennes",
  category: "Piano",
  name: "Piano Samick SU118SP ",
  description: "Bonjour,je vous propose mon piano pour vos évèenements festifs. Ne pas hesiter à me contacter pour plus d'informations.",
  photo: File.open(Rails.root.join("db/fixtures/instruments/piano.jpg")),
  price: 17,
  available: true,
  )

trompette = Instrument.create(
  user: anatole,
  city: "VAnnes",
  category: "Trompette",
  name: "Trompette à palettes Yamaha YTR-436G",
  description: "Hello, si vous avez besoin d'une trompette pour vous entrainez, je vous recommande fortement la mienne.",
  photo: File.open(Rails.root.join("db/fixtures/instruments/trompette.jpg")),
  price: 5,
  available: true,
  )



# seed reservation

reservation_1 = Reservation.create(
  user: haydar,
  instrument: guitare,
  message: "Bonjour, j'aimerais louer votre guitare gibson dans le cadre d'un mariage.",
  start_date: "2018-04-05",
  end_date: "2018-04-08",
  total_price: 15,
  status: "pending",
  )


puts 'Finished!'
