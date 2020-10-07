class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
    
    def current_cart
        if !session[:cart_id].nil?
            Cart.find(session[:cart_id])
        else
            Cart.new
        end
    end

    def configure_permitted_parameters
 
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone, :street_address, :city, :county, :postcode])

        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone, :street_address, :city, :county, :postcode])
    end
end
