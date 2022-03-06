class CreateVehicle < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :plate_number
      t.integer :vehicle_type, :default => 0
      t.timestamps
    end
  end
end
