class RidesController < ApplicationController

  def index
    @rides = Ride.all
  end

  def new
    @ride = Ride.new
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def create
    p "*" * 30
    p params
    p "*" * 30
    @ride = Ride.new(ride_params)
    if @ride.save
      render :template => 'searches/index'
    else
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:starting_point, :destination, :user_id)
  end

end
