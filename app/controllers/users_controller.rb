class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    if @user.update(user_params)
      flash[:success] = t('message.success')
      redirect_to login_url
    else
      flash.now[:error] = t('message.fault')
      render :new
    end
  end

  def index
    if params[:follow] == nil
      @users = User.all.where.not(id: current_user.id)
    elsif params[:follow] == "marked"
      @users = current_user.following.all
    end
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
