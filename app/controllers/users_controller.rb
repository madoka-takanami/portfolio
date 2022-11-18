class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_url, success: "登録しました"
    else
      flash.now[:danger] = "やり直し"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :generation, :password, :password_confirmation )
  end
end
