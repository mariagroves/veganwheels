class MenuItem < ApplicationRecord
  belongs_to :restaurant
  belongs_to :section
  has_many :menu_options, dependent: :destroy
  has_many :order_items
  has_many :order_item_options, through: :order_items
  validates :name, :price, :description, presence: true
  validate :section_for_restaurant

  def section_for_restaurant
    if !section.nil? && section.restaurant != restaurant
        errors.add(:section, "You have selected a section linked to another restaurant. Please try again.")
    end
  end 
end
