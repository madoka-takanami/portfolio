class SpotsController < ApplicationController
  def new
    @spot = Spot.new
  end

  def create
    restaurant = current_user.restaurants.find_by(restaurant_id: params[:id])
    @spot = Spot.restaurant.create(params[:spot_params])
    if @spot.save
      redirect_to restaurants_path
    else
      render :new
      flash[:warning] = '地図が見つかりませんでした'
    end
  end

  def index
    #@spots = current_user.restaurants.spots
  end

  def destroy
    spot = Spot.find(params[:id])
    spot.destroy
    redirect_to :index
  end

  private

  def spot_params
    params.require(:spot).permit(:address, :latitude, :longitude, :restaurant_id)
  end
end
