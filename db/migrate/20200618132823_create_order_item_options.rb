class CreateOrderItemOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :order_item_options do |t|
      t.references :menu_option, null: false, foreign_key: true
      t.references :order_item, null: false, foreign_key: true
      t.integer :quantity
      t.integer :unit_price_cents
      t.integer :total_price_cents

      t.timestamps
    end
  end
end
