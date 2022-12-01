class OthersRestaurantsController < RestaurantsController

  def index
    @restaurant = Restaurant.new
    @other_list = Restaurant.where.not(user_id: current_user.id).ransack(params[:q])
    @restaurants = @other_list.result(distinct: true)
    @random_select = @restaurants.shuffle.first
  end
end
