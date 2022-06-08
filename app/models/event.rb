class Event < ApplicationRecord
  FLAGS = {
    French: "🇫🇷",
    English: "🇬🇧",
    Spanish: "🇪🇸",
    Portuguese: "🇵🇹"
  }
  LANGUAGES = ["French", "English", "Spanish", "Portuguese"]
  CATEGORIES = ["Dinner","Cooking Class", "Food Tour", "Brunch"]

  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :participants, through: :bookings, source: :user
  has_one :chatroom
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :title, :category, :address, :description, :date, :language, :capacity, presence: true
  validates :category, inclusion: { in: CATEGORIES  }
  validates :language, inclusion: { in: LANGUAGES }

end
