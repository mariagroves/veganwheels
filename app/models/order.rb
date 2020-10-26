class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  belongs_to :restaurant
  has_many :order_items, through: :cart
  has_one :delivery, dependent: :destroy
  before_save :set_order_price
  before_save :set_delivery_price
  before_save :set_total_price
  # rider gets notified once order paid
  after_update :notify_riders
  # restaurant gets notified once order paid
  after_update :notify_restaurant
  validates :user, :cart, presence: true
  # user can't checkout with the same cart multiple times
  validates :cart, uniqueness: {scope: :user}, on: :create

  def self.delete_expired_orders
    Order.where('created_at <= ?', Time.now - 10.hours).where(state: 'pending').each do |order|
      OrderWorker.perform_async(order.id)
    end
  end

  def name
    id
  end

  def status_report
    if !self.delivery.present? && self.state == "paid"
      {alert: "Your order is being assigned to a rider."}
    elsif self.state == "refunded"
      {alert: "Your order has been cancelled and refunded."}
    elsif !self.delivery.is_collected
      {notice: "The rider is picking up your order."}
    elsif self.delivery.is_collected && !self.delivery.is_delivered
      {notice: "You order has been collected."}
    elsif self.delivery.is_delivered
      {success: "Your order has been delivered."}
    end
  end

  def notify_riders
    if !self.is_assigned && self.open && state == "paid"
      client = Twilio::REST::Client.new

      RiderUser.where(is_active: true, is_available: true).find_each do |rider|
              client.messages.create(
                  from: ENV['TWILIO_PHONE_NUMBER'],
                  to: rider.phone,
                  body: 'A new delivery job is available on VeganWheels!'
              )
      end
    end
  end

  def notify_restaurant
    if !self.is_assigned && self.open && state == "paid"
      client = Twilio::REST::Client.new
      
      client.messages.create(
          from: ENV['TWILIO_PHONE_NUMBER'],
          to: self.restaurant.admin_user.phone,
          body: 'You have a new order on VeganWheels!'
      )
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
