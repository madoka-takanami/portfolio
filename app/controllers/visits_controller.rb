class VisitsController < ApplicationController
  def create
    @restaurants = Restaurant.find(params[:restaurant_id])
    current_user.visit(@restaurants)
  end

  def destroy
    @restaurants = Restaurant.find(params[:restaurant_id])
    current_user.unvisited(params[:restaurant_id])
  end
end
