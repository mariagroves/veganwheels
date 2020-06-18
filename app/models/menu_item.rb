class MenuItem < ApplicationRecord
  belongs_to :restaurant
  belongs_to :section
  has_many :menu_options, dependent: :destroy
  has_many :order_items
  has_many :order_item_options, through: :order_items
  has_many :carts, through: :order_items
end
