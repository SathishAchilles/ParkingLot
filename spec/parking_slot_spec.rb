require 'parking_slot'
require 'parking_layout'

describe ParkingSlot, "#number" do
  context "slot is given a number" do
    parking_slot = ParkingSlot.new(ParkingLayout::ENTRY_POINT)
    it "should start at 1 from the increasing with entry point" do
      expect(parking_slot.number).to eq (ParkingLayout::ENTRY_POINT + 1)
    end
  end
end

describe ParkingSlot, "#number" do
  context "Each slot number" do
    slots = 3
    parking_slots = []
    entry_point = ParkingLayout::ENTRY_POINT
    parking_slots << ParkingSlot.new(entry_point)
    (slots -1).times{ parking_slots << ParkingSlot.new() }
    parking_slots.each.with_index(entry_point) do |slot, k|
      it "should increase with increasing distance: #{k} from the entry point: #{entry_point} in steps of #{ParkingLayout::INCREASING_STEP}" do
        expect(slot.number).to eq ( entry_point += ParkingLayout::INCREASING_STEP)
      end
    end
  end
end

describe ParkingSlot, "#available" do
  context "available parking slot" do
    parking_slot = ParkingSlot.new
    it "should return true when available" do
      expect(parking_slot.available).to be_truthy
    end
  end
  context "available parking slot" do
    parking_slot = ParkingSlot.new
    parking_slot.allocate(Car.new("KA-01-HH-1234", "White"))
    it "should return false when unavailable and already allocated" do
      expect(parking_slot.available).to be_falsey
    end
  end
end
