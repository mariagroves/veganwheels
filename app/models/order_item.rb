class OrderItem < ApplicationRecord
  belongs_to :menu_item
  has_many :order_item_options
  has_many :menu_options, through: :order_item_options
  # belongs_to :cart
  accepts_nested_attributes_for :order_item_options
  # accepts_nested_attributes_for :carts
end