class VehiclesController < ApplicationController

  def manage
    @parking_lot = ParkingLot.first
    @entry_points = EntryPointsGenerator.call @parking_lot.entry_point
  end

  def park
    #create vehicle
    #create parking transaction
    #update parking transaction status to started
  end

end
