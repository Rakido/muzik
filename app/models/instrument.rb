class Instrument < ApplicationRecord
  CATEGORIES = ['Guitare', "Violon", "Piano", "Trompette", "Batterie", "Cor De Chasse"]

  belongs_to :user
  has_many :reservations

  validates :city, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 600 }
  validates :price, presence: true
end
