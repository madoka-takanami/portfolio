class GuestController < ApplicationController
  skip_before_action :require_login, only: %i[create]

  def create
    guest = User.find_by(email: ENV['GUEST_MAIL'])
    puts "+++++++++++++++++++++++"
    puts guest
    auto_login(guest)
    redirect_to restaurants_path
    flash[:success] = t('.login_as_guest')
  end
end
