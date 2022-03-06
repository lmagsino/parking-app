module ParkingSlotManager
  class ParkingSlotAssignor < ApplicationService

    def initialize vehicle
      @vehicle = vehicle
    end

    def call
      ParkingSlot.create @parking_slot
    end

  end
end

