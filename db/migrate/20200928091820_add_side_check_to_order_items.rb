class AddSideCheckToOrderItems < ActiveRecord::Migration[6.0]
  def change
    add_column :order_items, :has_side, :boolean
  end
end
