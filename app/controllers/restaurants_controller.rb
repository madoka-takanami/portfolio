class RestaurantsController < ApplicationController
  def new
  end

  def index
    @restaurants = current_user.restaurants
  end

  def edit
  end

  private

  def set_restaurant
    @restaurant = current_user.restaurants.find(params[:id])
  end
end
