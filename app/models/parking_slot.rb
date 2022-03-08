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



  scope :under, -> (parking_lot)do
    where :parking_lot => parking_lot
  end

  scope :with_parking_type, -> (parking_type)do
    where :parking_type => parking_type
  end

  scope :available, -> do
    where :status => :available
  end



  def continuous_rate
    case self.parking_type.to_sym
    when :small
      self.parking_lot.small_parking_rate
    when :medium
      self.parking_lot.medium_parking_rate
    when :large
      self.parking_lot.large_parking_rate
    end
  end

end
