class UserMailer < ApplicationMailer

  def reset_password_email(user)
    @user = User.find(user.id)
    @url = edit_password_reset_url(@user.reset_password_token)
    mail(to: user.email, subject: "password has been reset")
  end

  def notion_email
    @user = User.where(notion: true).shuffle.first
    @restaurant = @user.restaurants.shuffle.first
    @url = 'takanami.mm@gmail.com'
    mail(to: @user.email, subject: 'がらぽんごはん')
  end
end
