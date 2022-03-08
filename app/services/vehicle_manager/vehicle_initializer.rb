module VehicleManager

  class VehicleInitializer < ApplicationService

    def initialize vehicle
      @vehicle = vehicle
    end

    def call
      vehicle = get_existing

      if vehicle
        vehicle.vehicle_type = vehicle[:vehicle_type]
      else
        vehicle = Vehicle.new @vehicle
      end

      vehicle.save
      vehicle
    end



    private

    def get_existing
      Vehicle.find_by :plate_number => @vehicle[:plate_number]
    end

  end

end
