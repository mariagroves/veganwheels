class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @restaurants = Restaurant.includes(:photo_attachment).all.sort_by(&:id)
    @search = params["search"]
    if @search.present?
      @postcode = @search["postcode"]
      @results_array = []

      @results_array << @results = Geocoder.search(@postcode)
      @results_array << @results2 = Geocoder.search(@postcode.split(//).insert(2, " ").join)
      @results_array << @results3 = Geocoder.search(@postcode.split(//).insert(3, " ").join)

      @results_array.each do |result|
        if !result.empty? && result.first.country == "United Kingdom"
          @coordinates = result.first.coordinates
        end
      end

      @restaurants = Restaurant.near(@coordinates, 3.9, units: :km).sort_by(&:id)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @menu_items = @restaurant.menu_items.includes(:section).where(is_active: true)
  end
end
