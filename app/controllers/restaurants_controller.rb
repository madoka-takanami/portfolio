class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
      flash[:info] = t('message.success')
    else
      flash.now[:warning] = t('message.fault')
      render :new
    end
  end

  def index
    @restaurant = Restaurant.new
    @q = current_user.restaurants.ransack(params[:q])
    @restaurants = @q.result(distinct: true)
    @random_select = @restaurants.shuffle.first
  end

  def show; end

  def edit; end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(params[:id])
      flash[:success] = t('message.updated')
    else
      flash.now[:error] = t('message.fault')
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
    flash[:success] = t('.success')
  end

  private

  def set_restaurant
    @restaurant = current_user.restaurants.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:rst_name, :rst_type, :place, :feature, :memo)
  end
end
