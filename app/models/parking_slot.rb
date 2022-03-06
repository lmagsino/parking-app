class ParkingSlot < ApplicationRecord

  belongs_to :parking_lot

  enum :parking_type => {
    :small => 0,
    :medium => 1,
    :large => 2,
  }



  state_machine :status, :initial => :available do
    event :occupy_slot do
      transition :available => :occupied
    end

    event :release_slot do
      transition :occupied => :available
    end
  end



  def self.test entry
    a = ParkingSlot.pluck(:id, :location).map do |id, location|
      {
        id: id,
        distance: location[entry]
      }
    end

    b = a.sort_by do |k|
      k[:distance]
    end

    b.first
  end

  def upload parking_slot_params
    # parking_lot = ParkingLot.create_or_retrieve_default
    # parking_type = parking_slot_params[:parking_type]
    # map = parking_slot_params[:map]


  end

end
