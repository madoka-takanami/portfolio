class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def not_authenticated
    redirect_to login_url
    flash[:info] = (t'message.login_first')
  end

  def guest?
    User.find(current_user.id) == User.find_by(email: ENV['GUEST_MAIL'])
  end
end
