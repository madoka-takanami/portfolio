class VisitsController < ApplicationController
  def create
    @restaurants = Restaurant.find(params[:restaurant_id])
    current_user.visit(@restaurants)
    redirect_to request.referer
  end

  def destroy
    current_user.unvisited(params[:restaurant_id])
    redirect_to request.referer
  end
end
