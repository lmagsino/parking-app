module ParkingSlotManager
  class ParkingSlotReleaaser < ApplicationService

    def initialize vehicle, transaction_time
      @vehicle = vehicle
      @transaction_time = transaction_time
    end

    def call
      parking_transaction = ParkingTransaction.find_by @vehicle

      end_time = format_transaction_time
      parking_transaction.end_time = end_time
      parking_transaction.amount =
        ParkingCalculator.call parking_transaction, end_time

      parking_transaction.save
    end



    private

    def format_transaction_time
      @transaction_time.to_datetime
    end


  end
end

