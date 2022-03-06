class CreateParkingTransaction < ActiveRecord::Migration[5.0]
  def change
    create_table :parking_transactions do |t|
      t.belongs_to :parking_slot, :index => true
      t.belongs_to :vehicle, :index => true
      t.decimal :amount
      t.boolean :returning
      t.datetime :start_time
      t.datetime :end_time
      t.string :status, :default => 'pending'
      t.timestamps
    end
  end
end
