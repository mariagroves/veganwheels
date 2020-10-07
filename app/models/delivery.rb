class Delivery < ApplicationRecord
  belongs_to :rider_user
  belongs_to :order
  validates :order_id, uniqueness: {scope: :rider_user}, on: :create
  validate :rider_is_available
  after_destroy :update_order_unassigned
  after_create :update_order_assigned
  after_update :save_collected_time
  after_update :save_delivered_time
  after_update :update_order_open

  def rider_is_available
    if !rider_user.is_available 
      errors.add(:rider_user, "is not available to take deliveries.")
    end
  end

  private

  def update_order_assigned
    self.order.update(is_assigned: true)
  end

  def update_order_unassigned
    self.order.update(is_assigned: false)
  end

  def update_order_open
    if self.is_collected && self.is_delivered
      self.order.update(open: false)
    else
      self.order.update(open: true)
    end
  end

  def save_collected_time
    if self.is_collected == true
      self.update_column(:time_collected, Time.now)
    else
      self.update_column(:time_collected, nil)
    end
  end

  def save_delivered_time
    if self.is_delivered == true
      self.update_column(:time_delivered, Time.now)
    else
      self.update_column(:time_delivered, nil)
    end
  end
end
