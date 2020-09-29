class AddIsOpenToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :is_open, :boolean, default: true
  end
end
