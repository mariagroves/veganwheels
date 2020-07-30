class MenuOption < ApplicationRecord
  belongs_to :menu_item
  has_many :order_item_options
  has_many :order_items, through: :order_item_options
end
