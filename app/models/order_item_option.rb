class OrderItemOption < ApplicationRecord
  belongs_to :menu_option
  belongs_to :order_item
end
