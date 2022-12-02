class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = t('.success')
      redirect_to login_url
    else
      flash.now[:error] = t('.fault')
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @restaurants = @user.restaurants
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :generation, :password, :password_confirmation )
  end
end
