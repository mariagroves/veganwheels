class OrderItemsController < ApplicationController
    before_action :set_menu_item, only: [ :create ]
    before_action :raise_pending_error, only: [:create]
    before_action :raise_closed_error, only: [:create]
    before_action :raise_location_error, only: [:create]
    skip_before_action :authenticate_user!, only: [:create, :destroy]

    def create
        @order_item = OrderItem.new(order_item_params)
        @cart = current_cart
        @order_item.cart = @cart
        @order_item.menu_item = @menu_item

        if !@cart.order_items.empty? && @order_item.menu_item.restaurant != @cart.order_items.first.menu_item.restaurant
            render 'order_items/wrong_restaurant_error'
            return
        end
        
        render 'order_items/create' if @order_item.save

        has_side = @order_item.order_item_options.exists?
        @order_item.update(has_side: has_side)
        
        session[:cart_id] = @cart.id
    end

    def destroy
        ids = params[:id].split('/').map(&:to_i)
        @order_items = OrderItem.find(ids)
        @order_item = @order_items.last
        @cart = @order_item.cart
        @order_items.each(&:destroy)
    end

    private

    def order_item_params
        params.require(:order_item).permit(:quantity, :note, :unit_price_cents, :total_price_cents,
                     order_item_options_attributes: [:menu_option_id])
    end

    def set_menu_item
        @menu_item = MenuItem.find(params[:menu_item_id])
    end

    def raise_pending_error
        if user_signed_in? && current_user.orders.where(state: 'pending').present?
            render 'order_items/checkout_error'
            return
        end
    end

    def raise_closed_error 
        restaurant = MenuItem.find(params[:menu_item_id]).restaurant

        if restaurant.is_currently_closed?
            render 'order_items/closed_restaurant_error'
            return
        end
    end

    def raise_location_error
        if user_signed_in?
            restaurant = MenuItem.find(params[:menu_item_id]).restaurant
            begin
                distance = restaurant.distance_from(Geocoder.search(current_user.address).first.coordinates, :km)
                if distance > 5 
                    render 'order_items/location_error'
                    return
                end
            rescue
                render 'order_items/address_error'
                return
            end
        end
    end
end
