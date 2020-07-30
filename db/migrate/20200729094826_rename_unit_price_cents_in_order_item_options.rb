class RenameUnitPriceCentsInOrderItemOptions < ActiveRecord::Migration[6.0]
  def change
    rename_column :order_item_options, :unit_price_cents, :price
  end
end
