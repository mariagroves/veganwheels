class AddAddressFieldsToRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :address
    add_column :restaurants, :street_address, :string
    add_column :restaurants, :city, :string
    add_column :restaurants, :county, :string
    add_column :restaurants, :postcode, :string
    add_column :restaurants, :country, :string, default: "United Kingdom"
  end
end
