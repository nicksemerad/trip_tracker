class AddressesController < ApplicationController
before_action :set_location 
before_action :set_address, only: [:show, :edit, :update, :destroy]


  def index
    @addresses = Address.all
  end

  def show
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to [@location, @address]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update
      redirect_to [@location, @address]
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to trip_locations_path [@trip, @location]
  end

  private

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip)
  end

  def set_location
    @location = Location.find(params[:location_id])
  end

  def set_address
    @address = Address.find(params[:id])
  end

end



# street:
# city: 
# state: 
# zip:
# location_id: