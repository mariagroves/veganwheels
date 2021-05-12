class MenuItem < ApplicationRecord
  belongs_to :restaurant
  belongs_to :section
  has_many :menu_options, dependent: :destroy
  has_many :order_items
  has_many :order_item_options, through: :order_items
  validates :name, :price, presence: true
  validate :section_for_restaurant

  def section_for_restaurant
    if Section.where(id: section, restaurant: restaurant).empty?
      errors.add(:restaurant, "You cannot add a new item for a section from a different restaurant. Please try again.")
    end
  end
end
