class VehiclesController < ApplicationController

  def manage
    @parking_lot = ParkingLot.first
    @entry_points = EntryPointsGenerator.call @parking_lot.entry_point
  end

  def park
    vehicle = VehicleCreator.call vehicle_params
    parking_transaction =
      ParkingSlotManager::ParkingSlotAssignor.call(
        vehicle, params[:transaction_time]
      )
  end

  def unpark
  end




  private

    # Only allow a list of trusted parameters through.
    def vehicle_params
      {
        :plate_number => params[:plate_number],
        :vehicle_type => params['vehicle_type']
      }
      # params.permit(:entry_point, :vehicle_type, :plate_number, :transaction_time)
    end

end
