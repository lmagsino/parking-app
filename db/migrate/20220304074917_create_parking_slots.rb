class CreateParkingSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :parking_slots do |t|
      t.belongs_to :parking_lot, :index => true
      t.integer :parking_type, :default => 0
      t.string :status, :default => 'available'
      t.integer :location, :array => true, :default => []
      t.timestamps
    end
  end
end
