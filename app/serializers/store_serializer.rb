class StoreSerializer < ActiveModel::Serializer
  attributes :id ,:name ,:location,:domain
  has_many :clients
  has_many :bookings
  has_many :barbers
  belongs_to :user
end
