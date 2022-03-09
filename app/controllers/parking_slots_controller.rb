class ParkingSlotsController < ApplicationController

  def index
    @parking_slots = ParkingSlot.all.order :created_at => :desc
  end

  def new
    @parking_slot = ParkingSlot.new
  end

  def create
    @parking_slots =
      ParkingSlotManager::ParkingSlotsCreator.call(
        parking_slot_params,
        params[:locations]
      )

    if @parking_slots.present?
      redirect_to(
        parking_slots_path,
        :notice => 'Parking Slot was successfully created.'
      )
    else
      render:index
    end
  end



  private

    def parking_slot_params
      params.require(:parking_slot).permit :parking_lot_id, :parking_type
    end

end
