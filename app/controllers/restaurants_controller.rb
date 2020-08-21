class RestaurantsController < ApplicationController
    before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [:index, :show]

    def index
        @restaurants = Restaurant.all
        @search = params["search"]
        if @search.present?
            @postcode = @search["postcode"] # "G327QR"
            @results_array = []

            @results_array << @results = Geocoder.search(@postcode)
            @results_array << @results2 = Geocoder.search(@postcode.split(//).insert(2, ' ').join)
            @results_array << @results3 = Geocoder.search(@postcode.split(//).insert(3, ' ').join)
        
            @results_array.each do |result|
                if !result.empty? && result.first.country == "United Kingdom"
                    @coordinates = result.first.coordinates
                end
            end

            @restaurants = Restaurant.near(@coordinates, 5, units: :km).sort_by(&:id)
        end
    end

    def show
    end

    def new
        @restaurant = Restaurant.new
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        @restaurant.save
        redirect_to restaurant_path(@restaurant)
    end

    def edit
    end

    def update
        @restaurant.update(restaurant_params)
        redirect_to restaurant_path(@restaurant)
    end

    def destroy
        @restaurant.destroy
        redirect_to restaurants_path
    end

      private

    def restaurant_params
        params.require(:restaurant).permit(:name, :address, :open_time, :close_time, :about, :phone, :email, :photo)
    end

    def set_restaurant
        @restaurant = Restaurant.find(params[:id])
    end
end
