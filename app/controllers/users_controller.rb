class UsersController < ApplicationController

  def login
  end

  def signup
    @user = User.new(user_params)
    if @user.save
      redirect_to save_ride_path(@user)
    else
      redirect_to root_path # need better error messaging
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
