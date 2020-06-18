class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.references :menu_item, null: false, foreign_key: true
      t.integer :quantity
      t.text :note
      t.integer :unit_price_cents
      t.integer :total_price_cents

      t.timestamps
    end
  end
end
