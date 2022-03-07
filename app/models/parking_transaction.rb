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

    after_transition :on => :start, :do => :occupy_parking_slot
  end



  def parking_lot
    self.parking_slot.parking_lot
  end

  def flat_rate
    self.parking_lot.flat_rate
  end

  def whole_day_rate
    self.parking_lot.whole_day_rate
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

  def flat_rate_duration
    self.parking_lot.flat_rate_duration
  end



  private

  def occupy_parking_slot
    self.parking_slot.occupy_slot
  end

end
