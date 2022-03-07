class AddFlatRateDurationToParkingLot < ActiveRecord::Migration[5.1]
  def change
    add_column :parking_lots, :flat_rate_duration, :integer
  end
end
