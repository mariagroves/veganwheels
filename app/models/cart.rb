class Cart < ApplicationRecord
    has_many :order_items

    def get_total
        total = 0
        order_items.collect do |order_item|
            total += order_item.total_price
            order_item.order_item_options.each do |option|
                total += option.total_price
            end
        end
        return total
    end
end
