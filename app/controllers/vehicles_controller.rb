class VehiclesController < ApplicationController


  def manage
    @parking_lot = ParkingLot.first
    @entry_points = EntryPointsGenerator.call @parking_lot.entry_point
  end

  def park
    parking_transaction =
      VehicleManager::ParkInitializer.call(
        vehicle_params,
        parking_slot_params,
        params[:transaction_time]
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
    parking_transaction =
      VehicleManager::UnparkInitializer.call(
        params[:plate_number], params[:transaction_time]
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
        :entry_point => AlphanumericUtility.letter_to_number(params[:entry_point])
      }
    end

end
