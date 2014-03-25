class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    if session[:user_id]
        @current_user ||= User.find(session[:user_id])
    end
  end

  def verify_logged_in
    if !current_user
      flash[:error] = "You must log in!"
      redirect_to new_auth_path
    end
  end

  def authenticate_user
    redirect_to auths_url unless current_user
  end

end