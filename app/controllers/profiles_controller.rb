class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]
  before_action :user_params, only: %i[update]

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path
      flash[:success] = t('message.success')
    else
      flash.now[:warning] = t('message.fault')
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :generation, :introduction, :notion, :avatar, :avatar_cache)
  end
end
