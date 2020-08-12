class Cart < ApplicationRecord
    has_many :order_items

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
        subtotal + 350
    end

    def get_quantity
        quantity = 0
        order_items.collect do |order_item|
            quantity += order_item.quantity
        end
        return quantity
    end
end
