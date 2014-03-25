class UsersController < ApplicationController
 before_action :verify_not_logged_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

private

  def verify_not_logged_in
    if current_user
      flash[:error] = "You must log out first!"
    redirect_to root_path
    end
  end
end
