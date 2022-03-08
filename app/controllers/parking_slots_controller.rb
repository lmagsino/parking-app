class ParkingSlotsController < ApplicationController

  def index
    @parking_slots = ParkingSlot.all.order :created_at => :desc
  end

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
        format.html { redirect_to parking_slots_path, notice: "Parking Slot was successfully created." }
        format.json { render :index, status: :created, location: @parking_slot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parking_slot.errors, status: :unprocessable_entity }
      end
    end
  end



  private

    # Only allow a list of trusted parameters through.
    def parking_slot_params
      params.require(:parking_slot).permit(:parking_lot_id, :parking_type)
    end

end
