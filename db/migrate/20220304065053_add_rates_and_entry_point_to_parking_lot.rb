class AddRatesAndEntryPointToParkingLot < ActiveRecord::Migration[5.0]
  def change
    add_column :parking_lots, :flat_rate, :decimal
    add_column :parking_lots, :small_parking_rate, :decimal
    add_column :parking_lots, :medium_parking_rate, :decimal
    add_column :parking_lots, :large_parking_rate, :decimal
    add_column :parking_lots, :overnight_rate, :decimal
    add_column :parking_lots, :entry_point, :integer
    add_column :parking_lots, :flat_rate_duration, :integer
  end
end
