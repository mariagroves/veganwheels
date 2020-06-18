class OrderItemsController < ApplicationController
    # don't need all these, edit later
    # before_action :set_order_item, only: [ :edit, :update, :destroy]
    before_action :set_menu_item, only: [ :new, :create ]
    # before_action :set_cart, only: [ :new, :create ]

    def new
        @order_item = OrderItem.new
    end

    def create
        @order_item = OrderItem.new(order_item_params)
        # @order_item.cart = @cart
        @order_item.menu_item = @menu_item
        @order_item.save
        # redirect_to?
    end

    private

    def order_item_params
        params.require(:order_item).permit(:quantity, :note, :unit_price_cents, :total_price_cents)
    end

    def set_menu_item
        @menu_item = MenuItem.find(params[:menu_item_id])
    end

    # def set_order_item
    #     @order_item = OrderItem.find(params[:id])
    # end

    # def set_cart
    #     @cart = Cart.find(params[:cart_id])
    # end
end
