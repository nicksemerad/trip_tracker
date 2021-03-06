class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :set_trip

  def index
    @locations = Location.all
  end

  def show
  end

  def new
  end

  def create
    @location = @trip.locations.new(location_params)
    if @location.save
      redirect_to [@trip, @location]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to trip_locations_path(@trip)
    else 
      render :edit
    end
  end


  private

  def set_location
    @location = Location.find(params[:id])
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_address
    @address = Address.find(params[:address_id])
  end

  def location_params
    params.require(:location).permit(:city, :state, :name)
  end
  
end
