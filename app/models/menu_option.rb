class MenuOption < ApplicationRecord
  belongs_to :menu_item
  has_one :restaurant, through: :menu_item
  has_many :order_item_options
  has_many :order_items, through: :order_item_options
  validates :name, presence: true
  validates :description, length: { maximum: 50 }
end
