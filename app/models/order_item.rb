class OrderItem < ApplicationRecord
  belongs_to :menu_item
  has_many :order_item_options, dependent: :destroy
  has_many :menu_options, through: :order_item_options
  belongs_to :cart
  accepts_nested_attributes_for :order_item_options
  before_save :set_unit_price
  before_save :set_total

  def name
    "#{self.menu_item.name}"
  end

  def unit_price
    self.menu_item.price
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
end