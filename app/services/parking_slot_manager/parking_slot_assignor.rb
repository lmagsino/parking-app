module ParkingSlotManager
  class ParkingSlotAssignor < ApplicationService

    def initialize vehicle, transaction_time, parking_slot_details
      @vehicle = vehicle
      @transaction_time = transaction_time
      @parking_slot_details = parking_slot_details
    end

    def call
      @parking_slot_details[:parking_type] =
        ParkingSlotTypeChecker.call @vehicle

      parking_slot = ParkingSlotChecker.call @parking_slot_details
      return false unless parking_slot

      parking_transaction_params = {
        :vehicle => @vehicle,
        :parking_slot => parking_slot,
        :start_time => format_transaction_time
      }

      parking_transaction =
        ParkingTransactionCreator.call parking_transaction_params

      parking_transaction.start
      parking_transaction
    end



    private

    def format_transaction_time
      @transaction_time.to_datetime
    end


  end
end

