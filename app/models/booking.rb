class Booking < ApplicationRecord
  belongs_to :store
  belongs_to :barber
  belongs_to :availability
  belongs_to :client
  belongs_to :hair_style

  def transform_booking
    return{
      store_id: self.store.name,
      barber_id: self.barber.first_name,
      availability_id: self.availability.available_at,
      client_id: self.client.last_name,
      hair_style_id: self.hair_style.name,
    }
  end
end
