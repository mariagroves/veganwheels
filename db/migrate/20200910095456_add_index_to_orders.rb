class AddIndexToOrders < ActiveRecord::Migration[6.0]
  def change
    add_index :orders, [:cart_id, :user_id], unique: true
  end
end
