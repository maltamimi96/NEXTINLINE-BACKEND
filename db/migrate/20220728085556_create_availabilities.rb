class CreateAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :availabilities do |t|
      t.time :available_at
      t.references :barber, null: false, foreign_key: true

      t.timestamps
    end
  end
end
