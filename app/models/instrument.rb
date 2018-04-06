class Instrument < ApplicationRecord
  CATEGORIES = ['Guitare', "Violon", "Piano", "Trompette", "Batterie", "Cor De Chasse"]

  belongs_to :user
  has_many :reservations

  validates :city, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :name, presence: true, length: { maximum: 60 }
  validates :description, presence: true, length: { maximum: 600 }
  validates :price, presence: true


  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?


  # Cloudinary, photo upload
  mount_uploader :photo, PhotoUploader
end


# magratte = Instrument.create!(city: 'Nantes', category: 'Guitare', name: 'gibson', description: 'super gratte', price: 250, user_id: 2)


# Flat.near('Tour Eiffel', 10)
