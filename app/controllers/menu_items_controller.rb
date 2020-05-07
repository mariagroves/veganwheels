class MenuItemsController < ApplicationController
    before_action :set_menu_item, only: [:show, :edit, :update, :destroy]

    def index
        @menu_items = MenuItems.all
    end

    def show
    end

    def new
        @menu_item = MenuItem.new
    end

    def create
        @menu_item = MenuItem.new(menu_item_params)
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
end
