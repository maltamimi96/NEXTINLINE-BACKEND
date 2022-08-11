class AddBookedToAvailability < ActiveRecord::Migration[7.0]
  def change
    add_column :availabilities, :booked, :boolean, default: false
  end
end
