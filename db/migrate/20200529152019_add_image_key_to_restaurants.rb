class AddImageKeyToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :imagekey, :integer
  end
end
