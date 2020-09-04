class AddRestaurantToSections < ActiveRecord::Migration[6.0]
  def change
    add_reference :sections, :restaurant, foreign_key: true
  end
end
