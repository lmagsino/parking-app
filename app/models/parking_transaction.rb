class Vehicle < ApplicationRecord

  belongs_to :parking_slot
  belongs_to :vehicle



  state_machine :status, :initial => :pending do
    event :start do
      transition :pending => :started
    end

    event :complete do
      transition :started => :completed
    end
  end

end
