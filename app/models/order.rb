class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  before_save :set_order_price
  before_save :set_delivery_price
  before_save :set_total_price
  validates :user, :cart, presence: true
  # user can't checkout with the same cart multiple times
  validates :cart, uniqueness: {scope: :user}, on: :create

  private

  def set_order_price
    self.order_price = self.cart.get_subtotal
  end

  def set_delivery_price
    self.delivery_price = Business.first.delivery_price 
  end

  def set_total_price
    self.total_price = self.order_price + self.delivery_price
  end
end
