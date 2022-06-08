class NetworksUser < ApplicationRecord
  belongs_to :user
  belongs_to :network
end
