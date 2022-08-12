class BookingSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :store
  belongs_to :barber
  belongs_to :availability
  belongs_to :client
  belongs_to :hair_style
end
