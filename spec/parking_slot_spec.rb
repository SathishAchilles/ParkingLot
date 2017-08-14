require 'parking_slot'
require 'parking_layout'

describe ParkingSlot, "#number" do
  parking_slot = ParkingSlot.new
  context "slot is given a number" do
    it "should start at 1 from the increasing with entry point" do
      expect(parking_slot.number).to eq (ParkingLayout::ENTRY_POINT + 1)
    end
  end

  context "Each slot number" do
    slots = 3
    parking_slots = []
    slots.times{ parking_slots << ParkingSlot.new }
    entry_point = parking_slot.number
    parking_slots.each.with_index(entry_point) do |slot, k|
      it "should increase with increasing distance: #{k} from the entry point: #{entry_point} in steps of #{ParkingLayout::INCREASING_STEP}" do
        expect(slot.number).to eq ( entry_point += ParkingLayout::INCREASING_STEP)
      end
    end
  end
end
