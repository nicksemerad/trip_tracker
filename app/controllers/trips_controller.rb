

class TripsController < ApplicationController
  
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  
  def index
    @trips = Trip.all
  end

  def show

  end

  def new
    @trip = Trip.new
  end

  def edit
  end

  def update 
    if trip.update(trip_params) 
      redirect_to @trip
    else
      render :edit 
    end
  end

  def destroy 
    Trip.find(params[:id]).destroy
    redirect_to root_path
  end 

  

  private 

  def set_trip
    trip = Trip.find(params[:id])

  end
  
  def trip_params
    params.require(:trip) .permit(:name) 
  end



end

