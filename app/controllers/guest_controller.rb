class GuestController < ApplicationController
  skip_before_action :require_login, only: %i[create]

  def create
    guest = User.find_by(email: "guest_gets@example.com")
    auto_login(guest)
    redirect_to others_restaurants_path
    flash[:success] = t('.login_as_guest')
  end
end
