module ParkingSlotManager
  class ParkingSlotChecker < ApplicationService

    def initialize parking_slot_details
      @parking_lot = parking_slot_details[:parking_lot]
      @parking_type = parking_slot_details[:parking_type]
      @entry_point = parking_slot_details[:entry_point]
    end

    def call
      parking_slots = get_available_parking_slots
      return false unless parking_slots

      sorted_parking_slots = get_sorted_parking_slots parking_slots
      sorted_parking_slots.first
    end



    private

    def get_available_parking_slots
      parking_slots =
        ParkingSlot.
          under(@parking_lot)
          .with_parking_type(@parking_type)
          .available

      return false if parking_slots.empty?
      get_formatted_parking_slots parking_slots
    end

    def get_formatted_parking_slots parking_slots
      loop do

        formatted_parking_slots =
          parking_slots.map do |parking_slot|
            location = parking_slot.location[@entry_point - 1]

            parking_slot if location.present?
          end.compact

        return formatted_parking_slots unless formatted_parking_slots.empty?
        @entry_point -= 1

      end
    end

    def get_sorted_parking_slots parking_slots
      parking_slots.sort_by do |parking_slot|
        parking_slot[:location][@entry_point - 1]
      end
    end

  end
end
