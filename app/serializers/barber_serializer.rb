class BarberSerializer < ActiveModel::Serializer
  attributes :id ,:first_name,:last_name
  belongs_to :store
end
