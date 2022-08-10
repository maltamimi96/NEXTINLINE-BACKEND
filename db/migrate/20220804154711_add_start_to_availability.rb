class AddStartToAvailability < ActiveRecord::Migration[7.0]
  def change
    add_column :availabilities, :start, :datetime
  end
end
