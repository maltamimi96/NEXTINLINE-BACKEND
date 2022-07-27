class AddStoreToClient < ActiveRecord::Migration[7.0]
  def change
    add_reference :clients, :store, null: false, foreign_key: true
  end
end
