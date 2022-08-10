class Availability < ApplicationRecord
  belongs_to :barber
  has_one :booking

  def transform_availability
    return{
      barber_id:self.barber.first_name,
      start:self.start,
      end:self.end


    }
  end








end
