class AddOrderTimeToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :order_time, :datetime
  end
end
