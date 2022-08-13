class AvailabilitySerializer < ActiveModel::Serializer
  attributes :id ,:start ,:end,:booked
  has_one :barber
end
