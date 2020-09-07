class Section < ApplicationRecord
    has_many :menu_items, dependent: :restrict_with_error
    belongs_to :restaurant
    validates :name, :order, presence: true
    validate :order_unique_for_restaurant

    def order_unique_for_restaurant
        if Section.where(restaurant_id: restaurant).exists?(order: order)
            errors.add(:order, "This section already exists")
        end
    end

end
