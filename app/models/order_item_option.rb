class OrderItemOption < ApplicationRecord
  belongs_to :menu_option
  belongs_to :order_item
  before_save :set_unit_price
  before_save :set_total
  before_save :set_quantity

  def quantity
    self.order_item.quantity
  end

  def unit_price
    if self.menu_option.price.nil?
      return 0
    else
      self.menu_option.price
    end
  end

  def total_price
    self.unit_price*self.quantity
  end

  private

  def set_unit_price
    self.unit_price = unit_price
  end

  def set_total
    self.total_price = total_price
  end

  def set_quantity
    self.quantity = quantity
  end
end
