class RenamePriceCentsInOrderItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :order_items, :unit_price_cents, :unit_price
    rename_column :order_items, :total_price_cents, :total_price
  end
end
