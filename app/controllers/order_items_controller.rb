class OrderItemsController < ApplicationController
    before_action :set_menu_item, only: [ :new, :create ]
    after_action :record_price, only: [:create]
    # before_action :set_cart, only: [ :new, :create ]

    def new
        @order_item = OrderItem.new
    end

    def create
        @order_item = OrderItem.new(order_item_params)
        # @order_item.cart = @cart
        @order_item.menu_item = @menu_item
        @order_item.unit_price = @menu_item.price
        @order_item.total_price = @menu_item.price * @order_item.quantity
        @order_item.save
        @options = @order_item.order_item_options
        # redirect_to?
    end

    private

    def order_item_params
        params.require(:order_item).permit(:quantity, :note, :unit_price_cents, :total_price_cents,
                     order_item_options_attributes: [:menu_option_id])
    end

    def set_menu_item
        @menu_item = MenuItem.find(params[:menu_item_id])
    end

    def record_price
        @options.each do |option|
            option.update(price: option.menu_option.price)
        end
    end

    # def set_cart
    #     @cart = Cart.find(params[:cart_id])
    # end
end
