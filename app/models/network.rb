class Network < ApplicationRecord
  belongs_to :user
  has_many :networkers, through: :networks_user, source: :user
end
