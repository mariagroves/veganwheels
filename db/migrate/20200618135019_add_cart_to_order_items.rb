class AddCartToOrderItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :order_items, :cart
  end
end
