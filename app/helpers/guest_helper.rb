module GuestHelper

  def guest?
    User.find_by(email: current_user.email) == User.find_by(email: ENV['GUEST_MAIL'])
  end
end
