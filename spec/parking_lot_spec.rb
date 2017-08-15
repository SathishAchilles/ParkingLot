require 'parking_lot'
require 'car'

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

describe ParkingLot, "#available_slots, #allocate_slot" do
  context "available parking slots" do
    parking_lot = ParkingLot.new
    parking_lot.slots = 3
    it "should return all available slots" do
      expect(parking_lot.available_slots.count).to eq 3
    end

    it "should return as available slots" do
      expect(parking_lot.available_slots).to all(be_a(ParkingSlot))
    end

    registration_number = "KA-01-HH-1234"
    colour = "White"
    vehicle = Car.new(registration_number, colour)
    it "shoud allocate parking slots" do
      expect(parking_lot.allocate_slot(vehicle)).to eq 1
    end
  end
end
