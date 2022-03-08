module VehicleManager

  class VehicleCreator < ApplicationService

    def initialize vehicle
      @vehicle = vehicle
    end

    def call
      Vehicle.create @vehicle
    end



    private

    def get_existing
      vehicle = Vehicle.find_by :plate_number => vehicle_params[:plate_number]
      vehicle
    end

  end

end
