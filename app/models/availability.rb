class Availability < ApplicationRecord
  belongs_to :barber
  has_one :booking
end
