class AddRatesAndEntryPointToParkingLot < ActiveRecord::Migration[5.0]
  def change
    add_column :parking_lots,
      :flat_rate,
      :decimal,
      :precision => 15,
      :scale => 4

    add_column :parking_lots,
      :small_parking_rate,
      :decimal,
      :precision => 15,
      :scale => 4

    add_column :parking_lots,
      :medium_parking_rate,
      :decimal,
      :precision => 15,
      :scale => 4

    add_column :parking_lots,
      :large_parking_rate,
      :decimal,
      :precision => 15,
      :scale => 4

    add_column :parking_lots, :entry_point, :integer
  end
end
