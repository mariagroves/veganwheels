class OrderItemOptionsController < ApplicationController
    # before_action :set_menu_option, only: [ :new, :create ]
    # before_action :set_order_item, only: [ :new, :create ]
    # # before_action :set_cart, only: [ :new, :create ]

    # def new
    #     @order_item_option = OrderItemOption.new
    # end

    # def create
    #     @order_item_option = OrderItemOption.new(order_item_option_params)
    #     @order_item_option.order_item = @order_item
    #     @order_item_option.price = @menu_option.price
    #     @order_item_option.save
    #     # redirect_to?
    # end

    # private

    # def order_item_option_params
    #     params.require(:order_item_option).permit(:menu_option_id)
    # end

    # def set_menu_option
    #     @menu_option = MenuOption.find(params[:menu_option_id])
    # end

    # def set_order_item
    #     @order_item = OrderItem.find(params[:order_item_id])
    # end
end
