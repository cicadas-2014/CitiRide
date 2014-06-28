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

end
