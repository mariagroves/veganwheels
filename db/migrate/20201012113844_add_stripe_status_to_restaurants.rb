class AddStripeStatusToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :is_onboarded, :boolean, default: :false
  end
end
