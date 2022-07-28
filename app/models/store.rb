class Store < ApplicationRecord
  belongs_to :user
  has_many :clients
  has_many :bookings
end
