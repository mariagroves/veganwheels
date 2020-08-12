module OrderItemsHelper
    
    def get_duplicates(order_item, cart)
        out = []
        other_order_items = cart.order_items.where.not(id: order_item.id)
        other_order_items.each do |item|
            matches_menu_item_id = item.menu_item_id == order_item.menu_item_id
            item_menu_option_ids = []
            order_item_menu_option_ids = []
            item.order_item_options.each do |option|
                item_menu_option_ids<<option.menu_option_id 
            end
            order_item.order_item_options.each do |option|
                order_item_menu_option_ids<<option.menu_option_id
            end
            require 'set'
            matches_menu_option_id = item_menu_option_ids.to_set == order_item_menu_option_ids.to_set
            if matches_menu_item_id && matches_menu_option_id
                out<<item
            end
        end
        out
    end

    def get_unique(cart)
        order_items_array = [] #all the ids in the cart
    
        cart.order_items.each do |oi|
            order_items_array<<oi.id
        end

        order_items_array.each do |id|
             duplicates = get_duplicates(OrderItem.find(id), cart)
            if duplicates.present?
                duplicates.each do |duplicate|
                    order_items_array.delete(duplicate.id)
                end
            end  
        end

        cart.order_items.where(id: order_items_array)
    end
end
