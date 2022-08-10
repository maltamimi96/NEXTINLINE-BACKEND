class AddEndToAvailability < ActiveRecord::Migration[7.0]
  def change
    add_column :availabilities, :end, :datetime
  end
end
