module ParkingSlotManager
  class ParkingSlotAssignor < ApplicationService

    def initialize vehicle, transaction_time
      @vehicle = vehicle
      @transaction_time = transaction_time
    end

    def call
      parking_transaction = {
        :vehicle => @vehicle,
        :parking_slot => ParkingSlotChecker.call(@vehicle.),
        :start_time => format_transaction_time
      }

      ParkingTransactionCreator.call parking_transaction
    end



    private

    def format_transaction_time
      @transaction_time.to_datetime
    end


  end
end

