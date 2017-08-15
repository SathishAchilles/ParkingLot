require 'parking_slot'
require 'parking_layout'
require 'car'

describe ParkingSlot, "#number" do
  context "slot is given a number" do
    parking_slot = ParkingSlot.new(ParkingLayout::ENTRY_POINT + 1)
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
    (entry_point..slots).each{|k|
      parking_slots << ParkingSlot.new(k+ParkingLayout::INCREASING_STEP)
    }
    parking_slots.each.with_index(entry_point) do |slot, k|
      it "should increase with increasing distance: #{k} from the entry point: #{entry_point} in steps of #{ParkingLayout::INCREASING_STEP}" do
        expect(slot.number).to eq ( entry_point += ParkingLayout::INCREASING_STEP)
      end
    end
  end
end

describe ParkingSlot, "#available" do
  context "available parking slot" do
    parking_slot = ParkingSlot.new(1)
    it "should return true when available" do
      expect(parking_slot.available).to be_truthy
    end
  end
  context "available parking slot" do
    parking_slot = ParkingSlot.new(2)
    parking_slot.allocate(Car.new("KA-01-HH-1234", "White"))
    it "should return false when unavailable and already allocated" do
      expect(parking_slot.available).to be_falsey
    end
  end

  context "#allocate" do
    it "should allocate vehicle to slot 1" do
      parking_slot = ParkingSlot.new(1)
      expect(parking_slot.allocate(Car.new("KA-01-HH-1234", "White"))).to eq 1
    end

    it "should allocate vehicle to slot 2" do
      parking_slot = ParkingSlot.new(2)
      expect(parking_slot.allocate(Car.new("KA-01-HH-5678", "White"))).to eq 2
    end
  end
end
