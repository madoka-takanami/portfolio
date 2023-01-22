class PasswordResetsController < ApplicationController
  skip_before_action :require_login, only: %i[new create edit update]

  def new; end

  def create
    @user = User.find_by(email: params[:email])

    puts "user_name+++++++++++++++++++++++;"
    puts ENV['USER_NAME']
    puts ENV['SENDGRID_API_KEY']
    @user.deliver_reset_password_instructions! if @user
    redirect_to login_path
    flash[:success] = (t '.sent_email')
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
    return not_authenticated if @user.blank?
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
    return not_authenticated if @user.blank?

    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.change_password(params[:user][:password])
      redirect_to login_path
      flash[:success] = (t '.password_changed')
    else
      flash.now[:warning] = (t '.not_cahnge_password')
      render :edit
    end
  end
end
