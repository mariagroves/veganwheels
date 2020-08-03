class RenameTotalPriceCentsToTotalPrice < ActiveRecord::Migration[6.0]
  def change
    rename_column :order_item_options, :total_price_cents, :total_price
  end
end
