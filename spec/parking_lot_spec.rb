require 'parking_lot'

describe ParkingLot, "#slots" do
  context "hold up to 'n' cars at any given point in time" do
    parking_lot = ParkingLot.new

    it "should open up the given n slots" do
      parking_lot.slots = 3
      expect(parking_lot.slots.count).to eq 3
    end

    it "should be parking slots" do
      expect(parking_lot.slots).to all(be_a(ParkingSlot))
    end

    it "should be empty when 'n' is nil" do
      parking_lot.slots = nil
      expect(parking_lot.slots).to be_empty
    end

    it "should be empty for any negative value for slots" do
      parking_lot.slots = -1
      expect(parking_lot.slots).to be_empty
    end

    it "should be empty if not a integer" do
      parking_lot.slots = "some dummy string"
      expect(parking_lot.slots).to be_empty
    end
  end
end
