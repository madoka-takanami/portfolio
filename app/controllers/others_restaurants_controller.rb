class OthersRestaurantsController < RestaurantsController
skip_before_action :require_login, only: %i[index show]

  def index
    @restaurant = Restaurant.new

    if logged_in?
      @other_list = Restaurant.where.not(user_id: current_user.id).ransack(params[:q])
    else
      @other_list = Restaurant.all.ransack(params[:q])
    end

    @restaurants = @other_list.result(distinct: true).order(created_at: "DESC")
    @random_select = @restaurants.shuffle.first
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    render "restaurants/show"
  end
end
