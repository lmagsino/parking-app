class ParkingSlotsController < ApplicationController

  def new
    @parking_slot = ParkingSlot.new
  end

  def create
    @parking_slot =
      ParkingSlotManager::ParkingSlotsCreator.call(
        parking_slot_params,
        params[:locations]
      )

    respond_to do |format|
      if @parking_slot
        format.html { redirect_to parking_slot_url(@parking_slot), notice: "Parking Slot was successfully created." }
        format.json { render :show, status: :created, location: @parking_slot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parking_slot.errors, status: :unprocessable_entity }
      end
    end
  end



  private

    # Only allow a list of trusted parameters through.
    def parking_slot_params
      {
        :parking_lot_id => params[:parking_lot_id],
        :parking_type => params[:parking_type]
      }
    end

end
