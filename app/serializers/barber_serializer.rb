class BarberSerializer < ActiveModel::Serializer
  attributes :id ,:first_name,:last_name,:store_id
  has_many :availabilitys
end
