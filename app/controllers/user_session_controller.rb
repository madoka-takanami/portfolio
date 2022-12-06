class UserSessionController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to restaurants_path, success: t('.success')
    else
      flash.now[:error] = t('.fault')
      render :new
    end
  end

  def destroy
    logout
    flash[:success] = t('.logout_success')
    redirect_to login_path
  end
end
