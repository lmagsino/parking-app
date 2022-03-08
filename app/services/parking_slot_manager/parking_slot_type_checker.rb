module ParkingSlotManager
  class ParkingSlotTypeChecker < ApplicationService

    def initialize vehicle_type
      @vehicle_type = vehicle_type
    end

    def call
      case @vehicle_type.to_sym

      when :large
        [:large]
      when :medium
        [:medium, :large]
      else
        [:small, :medium, :large]
      end

    end

  end
end

