class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id]).save
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(followed_id: params[:user_id])
  end
end
