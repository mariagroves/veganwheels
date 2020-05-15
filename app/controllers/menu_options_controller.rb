class MenuOptionsController < ApplicationController
    before_action :set_menu_option, only: [ :edit, :update, :destroy]
    before_action :set_menu_item, only: [ :new, :create ]

    # dont need new if new menu option is not having its own page, see eg comments in pickeled
    # sort out the redirects
    # add error messages
    def new
        @menu_option = MenuOption.new
    end

    def create
        @menu_option = MenuOption.new(menu_option_params)
        @menu_option.menu_item = @menu_item
        @menu_option.save
        redirect_to menu_option_path(@menu_option)
    end

    def edit
    end

    def update
        @menu_option.update(menu_option_params)
        redirect_to menu_option_path(@menu_option)
    end

    def destroy
        @menu_option.destroy
        redirect_to menu_options_path
    end

      private

    def menu_option_params
        params.require(:menu_option).permit(:name, :price, :description)
    end

    def set_menu_option
        @menu_option = MenuOption.find(params[:id])
    end

    def set_menu_item
        @menu_item = menu_item.find(params[:menu_item_id])
    end
end
