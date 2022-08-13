class AddDomainToStore < ActiveRecord::Migration[7.0]
  def change
    add_column :stores, :domain, :string
  end
end
