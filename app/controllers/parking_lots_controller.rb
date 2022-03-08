class ParkingLotsController < ApplicationController

  before_action :set_parking_lot, :only => [:show, :edit, :update]



  def index
    @parking_lots = ParkingLot.all
  end

  def new
    @parking_lot = ParkingLot.new
  end

  def create
    @parking_lot = ParkingLot.new parking_lot_params

    @parking_lot.save ?
      redirect_to_index('Parking lot was successfully created.') :
      render(:new)
  end

  def update
    @parking_lot.update(parking_lot_params) ?
      redirect_to_index('Parking lot was successfully updated.') :
      render(:edit)
  end



  private

    def set_parking_lot
      @parking_lot = ParkingLot.find params[:id]
    end

    def parking_lot_params
      params.require(:parking_lot).permit(
        :name, :address, :entry_point, :flat_rate, :overnight_rate,
        :small_parking_rate, :medium_parking_rate, :large_parking_rate,
        :flat_rate_duration
      )
    end

    def redirect_to_index message
      redirect_to parking_lot_path(@parking_lot), :notice => message
    end

end
