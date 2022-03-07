class ParkingTransaction < ApplicationRecord

  belongs_to :parking_slot
  belongs_to :vehicle



  state_machine :status, :initial => :pending do
    event :start do
      transition :pending => :started
    end

    event :complete do
      transition :started => :completed
    end
  end



  def parking_lot
    self.parking_slot.parking_lot
  end

  def flat_rate
    self.parking_lot.flat_rate
  end

  def continuous_rate
    case self.parking_slot.parking_type.to_sym
    when :small
      self.small_parking_rate
    when :medium
      self.medium_parking_rate
    when :large
      self.large_parking_rate
    end
  end

  def small_parking_rate
    self.parking_lot.small_parking_rate
  end

  def medium_parking_rate
    self.parking_lot.medium_parking_rate
  end

  def large_parking_rate
    self.parking_lot.large_parking_rate
  end

end
