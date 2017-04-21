class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      msg = UserMailer.welcome_message(@user)
      msg.deliver_now

      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def activate
    @user = User.find_by(id: params[:id])
    @user.activated = true
    @user.save
    login_in_user!(@user)
    redirect_to user_url(@user)
  end

  def show
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
