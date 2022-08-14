class RemoveDomainFromStore < ActiveRecord::Migration[7.0]
  def change
    remove_column :stores, :domain, :string
  end
end
