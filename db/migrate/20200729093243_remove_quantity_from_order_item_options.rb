class RemoveQuantityFromOrderItemOptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :order_item_options, :total_price_cents, :integer
    remove_column :order_item_options, :quantity, :integer
  end
end
