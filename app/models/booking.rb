class Booking < ApplicationRecord
  has_many :reviews
  belongs_to :event
  belongs_to :user
end
