class RemoveAvailableAtFromAvailabilities < ActiveRecord::Migration[7.0]
  def change
    remove_column :availabilities, :available_at, :time
  end
end
