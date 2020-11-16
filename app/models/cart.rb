class Cart < ApplicationRecord
    has_many :order_items
    has_one :order

    def get_subtotal
        total = 0
        order_items.collect do |order_item|
            total += order_item.total_price
            order_item.order_item_options.each do |option|
                total += option.total_price
            end
        end
        return total
    end

    def get_total
        subtotal = get_subtotal
        subtotal + Business.first.delivery_price
    end

    def get_quantity
        quantity = 0
        order_items.collect do |order_item|
            quantity += order_item.quantity
        end
        return quantity
    end

    def restaurant
        self.order_items.first.menu_item.restaurant
    end

    def is_below_minimum_spend
        self.restaurant.min_spend > self.get_subtotal
    end
end
