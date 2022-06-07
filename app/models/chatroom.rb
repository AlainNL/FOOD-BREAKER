class Chatroom < ApplicationRecord
  has_many :messages
  has_many :users, through: :message
  belongs_to :event
end
