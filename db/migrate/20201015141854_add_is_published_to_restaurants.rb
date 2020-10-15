class AddIsPublishedToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :is_published, :boolean, default: :false
  end
end
