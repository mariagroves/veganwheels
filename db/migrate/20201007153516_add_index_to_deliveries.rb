class AddIndexToDeliveries < ActiveRecord::Migration[6.0]
  def change
    add_index :deliveries, [:rider_user_id, :order_id], unique: true
  end
end
