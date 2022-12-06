class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def not_authenticated
    redirect_to login_url
    flash[:info] = (t'message.login_first')
  end
end
