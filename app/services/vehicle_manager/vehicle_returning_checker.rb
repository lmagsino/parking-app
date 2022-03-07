module VehicleManager

  class VehicleReturningChecker < ApplicationService

    def initialize vehicle, transaction_time
      @vehicle = vehicle
      @transaction_time = transaction_time
    end

    def call
      end_time = @vehicle.latest_parking_transaction.start_time

      return false if end_time > @transaction_time
      end_time <= (@transaction_time - 1.hour)
    end

  end

end
