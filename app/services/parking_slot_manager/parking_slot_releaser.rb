module ParkingSlotManager
  class ParkingSlotReleaser < ApplicationService

    def initialize vehicle, transaction_time
      @vehicle = vehicle
      @transaction_time = transaction_time
    end

    def call
      parking_transaction = @vehicle.latest_parking_transaction
      parking_transaction.end_time = format_transaction_time
      parking_transaction.complete

      parking_transaction
    end



    private

    def format_transaction_time
      @transaction_time.to_datetime
    end

  end
end

