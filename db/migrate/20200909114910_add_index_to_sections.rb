class AddIndexToSections < ActiveRecord::Migration[6.0]
  def change
    add_index :sections, [:order, :restaurant_id], unique: true
  end
end
