class AddAddressToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :street_address, :string
    add_column :users, :city, :string
    add_column :users, :county, :string
    add_column :users, :postcode, :string
  end
end
