class SearchesController < ApplicationController

  def index
  end

  def show
    find_closest_stations(params[:s])
    find_closest_stations(params[:d])
  end

  def login
    render :partial => 'login'
  end

  def signup
    render :partial => 'signup'
  end

end
