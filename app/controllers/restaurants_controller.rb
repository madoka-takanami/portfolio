class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path, success: "登録しました"
    else
      flash.now[:error] = "やり直して下さい"
      render :new
    end
  end

  def index
    @restaurant = Restaurant.new
    @restaurants = current_user.restaurants
  end

  def edit
  end

  private

  def set_restaurant
    @restaurant = current_user.restaurants.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:rst_name, :rst_type, :place, :feature, :memo)
  end
end
