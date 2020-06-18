class OrderItem < ApplicationRecord
  belongs_to :menu_item
  # belongs_to :cart
  # accepts_nested_attributes_for :order_item_options
  # accepts_nested_attributes_for :carts
end

# ,
#             order_items_attributes: [:id, :quantity, :note, :unit_price_cents, :total_price_cents]