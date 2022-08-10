class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :store, null: false, foreign_key: true
      t.references :barber, null: false, foreign_key: true
      t.references :availability, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.references :hair_style, null: false, foreign_key: true

      t.timestamps
    end
  end
end
