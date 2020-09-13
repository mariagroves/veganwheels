class OrderItem < ApplicationRecord
  belongs_to :menu_item
  after_destroy :update_order
  after_save :update_order
  has_many :order_item_options, dependent: :destroy
  has_many :menu_options, through: :order_item_options
  belongs_to :cart
  accepts_nested_attributes_for :order_item_options
  before_save :set_unit_price
  before_save :set_total
 
  # around_save :update_order

  # def destroy_orphaned_cart
  #   cart = self.cart
  #   yield # executes a DELETE database statement
  #   if cart.order_items.length == 0
  #     cart.destroy
  #   end  
  # end

  def update_order
    if self.cart.order.present?
      @order = self.cart.order
      @order.update(
        order_price: self.cart.get_subtotal, 
        total_price: self.cart.get_subtotal + @order.delivery_price)
    end
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