class MenuItemsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:show]

    def show 
        @menu_item = MenuItem.find(params[:id])
        render 'menu_items/show'
    end

end
