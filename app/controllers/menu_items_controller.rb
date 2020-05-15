class MenuItemsController < ApplicationController
    before_action :set_menu_item, only: [ :edit, :update, :destroy]
    before_action :set_restaurant, only: [ :new, :create ]

    # dont need new if new menu item is not having its own page, see eg comments in pickeled
    # sort out the redirects
    # add error messages
    def new
        @menu_item = MenuItem.new
    end

    def create
        @menu_item = MenuItem.new(menu_item_params)
        @menu_item.restaurant = @restaurant
        @menu_item.save
        redirect_to menu_item_path(@menu_item)
    end

    def edit
    end

    def update
        @menu_item.update(menu_item_params)
        redirect_to menu_item_path(@menu_item)
    end

    def destroy
        @menu_item.destroy
        redirect_to menu_items_path
    end

      private

    def menu_item_params
        params.require(:menu_item).permit(:name, :price, :description, :is_active)
    end

    def set_menu_item
        @menu_item = MenuItem.find(params[:id])
    end

    def set_restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
    end
end
