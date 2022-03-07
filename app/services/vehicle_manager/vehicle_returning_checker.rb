module VehicleManager

  class VehicleReturningChecker < ApplicationService

    SECONDS_IN_HOUR = 3600



    def initialize vehicle, transaction_time
      @vehicle = vehicle
      @transaction_time = transaction_time
    end

    def call
      end_time = @vehicle.latest_parking_transaction.end_time
      return false if end_time.nil? || end_time > @transaction_time

      transaction_time = Time.parse @transaction_time.to_s
      end_time = Time.parse end_time.to_s

      total_time_difference = (transaction_time - end_time)
      raise total_time_difference.inspect
      total_time_difference <= SECONDS_IN_HOUR
    end

  end

end
