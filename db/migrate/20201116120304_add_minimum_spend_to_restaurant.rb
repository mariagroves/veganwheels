class AddMinimumSpendToRestaurant < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :min_spend, :integer
  end
end
