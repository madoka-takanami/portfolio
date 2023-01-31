module GuestHelper

  def guest?
    User.find_by(email: current_user.email) == User.find_by(email: "guest_gets@example.com")
  end
end
