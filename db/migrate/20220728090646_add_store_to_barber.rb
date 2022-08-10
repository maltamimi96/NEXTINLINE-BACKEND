class AddStoreToBarber < ActiveRecord::Migration[7.0]
  def change
    add_reference :barbers, :store, null: false, foreign_key: true
  end
end
