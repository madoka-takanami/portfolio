class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:user_id]).save
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(followed_id: params[:user_id])
    redirect_to request.referer
  end
end
