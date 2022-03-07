class VehiclesController < ApplicationController


  def manage
    @parking_lot = ParkingLot.first
    @entry_points = EntryPointsGenerator.call @parking_lot.entry_point
  end

  def park
    vehicle = Vehicle.find_by :plate_number => vehicle_params[:plate_number]

    if vehicle.nil?
      vehicle = VehicleManager::VehicleCreator.call vehicle_params
    end


    parking_transaction =
      ParkingSlotManager::ParkingSlotAssignor.call(
        vehicle,
        params[:transaction_time],
        parking_slot_params
      )

    status = :bad_request

    if parking_transaction
      status = :created
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
    vehicle = Vehicle.find_by :plate_number => params[:plate_number]
    vehicle.latest_parking_transaction

    parking_transaction =
      ParkingSlotManager::ParkingSlotReleaser.call(
        vehicle,
        params[:transaction_time]
      )

    status = :bad_request

    if parking_transaction
      status = :ok
      result =
      {
        :amount => parking_transaction.amount
      }
    end

    respond_to do |format|
      format.json {
        render :json => result, :status => status
      }
    end
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
