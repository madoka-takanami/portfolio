class VisitsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    current_user.visit(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    current_user.unvisited(params[:restaurant_id])
  end
end
