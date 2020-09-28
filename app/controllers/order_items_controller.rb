class OrderItemsController < ApplicationController
    before_action :set_menu_item, only: [ :new, :create ]
    skip_before_action :authenticate_user!, only: [:new, :create, :destroy]

    def new
        @order_item = OrderItem.new
    end

    def create
        if user_signed_in? && current_user.orders.where(state: 'pending').present?
            render 'order_items/checkout_error'
            return
        end
        @order_item = OrderItem.new(order_item_params)
        @cart = current_cart
        @order_item.cart = @cart
        @order_item.menu_item = @menu_item

        if !@cart.order_items.empty? && @order_item.menu_item.restaurant != @cart.order_items.first.menu_item.restaurant
            render 'order_items/error'
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

end
