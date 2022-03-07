class VehiclesController < ApplicationController


  def manage
    @parking_lot = ParkingLot.first
    @entry_points = EntryPointsGenerator.call @parking_lot.entry_point
  end

  def park
    vehicle = VehicleManager::VehicleCreator.call vehicle_params

    parking_transaction =
      ParkingSlotManager::ParkingSlotAssignor.call(
        vehicle,
        params[:transaction_time],
        parking_slot_params
      )

    status = :bad_request

    if parking_transaction
      result =
      {
        :location => parking_transaction.parking_slot.location
      }
    end

    respond_to do |format|
      format.json {
       render :json => result, :status => status
      }
    end

  end

  def unpark
  end




  private

    def vehicle_params
      {
        :plate_number => params[:plate_number],
        :vehicle_type => params[:vehicle_type]
      }
    end

    def parking_slot_params
      parking_lot = ParkingLot.first

      {
        :parking_lot => parking_lot,
        :entry_point => params[:entry_point].downcase.ord - 96
      }
    end

end
