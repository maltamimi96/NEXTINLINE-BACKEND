class Barber < ApplicationRecord
    has_many :availabilitys
    has_many :bookings
end
