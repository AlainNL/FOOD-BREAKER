class Review < ApplicationRecord
  belongs_to :event
  validates :content, length: {minimum: 5}
end
