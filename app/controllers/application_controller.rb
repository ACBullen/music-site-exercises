class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    current_user ? true : false
  end

  def login_in_user!(user)
    session[:session_token] = user.reset_sesion_token!
  end

  def require_login
    unless logged_in?
      flash[:errors] = ["You must log in first"]
      redirect_to new_session_url
    end
  end
end
