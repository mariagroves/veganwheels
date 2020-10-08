class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  belongs_to :restaurant
  has_many :order_items, through: :cart
  has_one :delivery
  before_save :set_order_price
  before_save :set_delivery_price
  before_save :set_total_price
  validates :user, :cart, presence: true
  # user can't checkout with the same cart multiple times
  validates :cart, uniqueness: {scope: :user}, on: :create

  #  this is a hotfix for ActiveAdmin has_one delivery / belongs_to order issue
  # def deliveries
  #   Delivery.where(order_id: id)
  #  end

  def name
    id
  end

  def status_report
    if !self.delivery.present?
      {alert: "Your order is being assigned to a rider."}
    elsif !self.delivery.is_collected
      {notice: "The rider is picking up your order."}
    elsif self.delivery.is_collected && !self.delivery.is_delivered
      {notice: "You order has been collected."}
    elsif self.delivery.is_delivered
      {success: "Your order has been delivered."}
    end
  end

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
