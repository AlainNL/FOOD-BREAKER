class Booking < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :event
  belongs_to :user
end
