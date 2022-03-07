class AddWholeDayRateToParkingLot < ActiveRecord::Migration[5.1]
  def change
    add_column :parking_lots,
      :whole_day_rate,
      :decimal,
      :precision => 15,
      :scale => 4
  end
end
