class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user && @user.activated
      login_in_user!(@user)
      redirect_to user_url(@user)
    elsif @user
      flash[:errors] = ["Activate account pls"]
      redirect_to new_session_url
    else
      flash[:errors] = ["Incorrect email/password"]
      redirect_to new_session_url
    end
  end

  def destroy
    if current_user
      current_user.reset_sesion_token!
      session[:session_token] = nil
      redirect_to new_session_url
    else
      redirect_to new_session_url
    end
  end
end
