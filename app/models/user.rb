class User < ApplicationRecord
  # Include default devise modules. Others available are:
  has_many :events
  has_many :networks
  has_many :bookings, through: :events
  has_one_attached :photo
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true
end
