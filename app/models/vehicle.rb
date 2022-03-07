class Vehicle < ApplicationRecord

  has_many :parking_transactions



  enum :vehicle_type => {
    :small => 0,
    :medium => 1,
    :large => 2,
  }

  def latest_parking_transaction
    self.parking_transactions.order(:start_time).last
  end

  def latest_completed_parking_transaction
    self.parking_transactions.order(:start_time).completed.last
  end

end
