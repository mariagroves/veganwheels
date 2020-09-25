class AddOpenStatusToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :open, :boolean, default: true
  end
end
