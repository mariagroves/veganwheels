class AddColumnsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :is_assigned, :boolean, default: false
    add_column :orders, :state, :string, default: 'pending'
    add_column :orders, :delivery_price, :integer, default: 350
  end
end
