class AvailabilitySerializer < ActiveModel::Serializer
  attributes :id ,:start ,:end
  has_one :barber
end
