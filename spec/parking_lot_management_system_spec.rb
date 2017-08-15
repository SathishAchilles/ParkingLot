require 'parking_lot_management_system'
require 'car'

describe ParkingLotManagementSystem do
  pms = ParkingLotManagementSystem.new

  context "#create_parking_lot" do
    it "should create parking lot" do
      expect(pms.create_parking_lot(6)).to eq 6
    end
  end

  context "#park" do
    pms.create_parking_lot(6)
    it "should park the vehicle" do
      expect(pms.park("KA-01-HH-1234","White")).to eq 1
    end
  end

  context "#leave" do
    pms.create_parking_lot(2)
    pms.park("KA-01-HH-1234","White")

    it "should clear out the parking slot" do
      expect(pms.leave(1)).to be_truthy
    end

    it "should make the slot available for parking again" do
      expect(pms.park("KA-01-HH-1234","White")).to eq 1
    end
  end
end
