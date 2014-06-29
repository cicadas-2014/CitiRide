class SearchesController < ApplicationController

  def index
  end

  def show

  end

  def login
    render :partial => 'login'
  end

  def signup
    render :partial => 'signup'
  end

end
