module ParkingSlotManager
  class ParkingSlotTypeChecker < ApplicationService

    def initialize vehicle
      @vehicle = vehicle
    end

    def call
      case @vehicle.vehicle_type.to_sym

      when :large
        [:large]
      when :medium
        [:medium, :large]
      else
        [:small]
      end

    end

  end
end

