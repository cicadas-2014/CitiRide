class SearchesController < ApplicationController

  def index
  end

  def show
    # p find_closest_bike(start: params[:s])
  end

  def login
    render :partial => 'login'
  end

  def signup
    render :partial => 'signup'
  end

  private

  def login_params
    params.permit(:username, :email, :password)
  end

  def signup_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
