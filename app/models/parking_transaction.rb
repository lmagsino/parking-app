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

    before_transition :on => :complete, :do => :compute_amount
    after_transition :on => :start, :do => :occupy_parking_slot
    after_transition :on => :complete, :do => :release_parking_slot
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
    self.parking_slot.continuous_rate
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

  def release_parking_slot
    self.parking_slot.release_slot
  end

  def compute_amount
    self.amount = ParkingCalculator.call self
  end

end
