class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # As owner
  has_many :instruments
  has_many :demands, through: :instruments, source: :reservations

  # As renter
  has_many :reservations, dependent: :destroy

  # Cloudinary, avatar upload
  mount_uploader :avatar, PhotoUploader

end
