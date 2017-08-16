require 'parking_lot_management_system'
require 'car'

describe ParkingLotManagementSystem do
  parking_lot_management_system = Class.new()
  parking_lot_management_system.include(ParkingLotManagementSystem)
  pms = parking_lot_management_system.new()
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

  context "#status display status" do
    it "should show the status of slot no, reg no, colour" do
      pms = parking_lot_management_system.new()
      pms.create_parking_lot(3)
      pms.park("KA-01-HH-1234","White")
      pms.park("KA-01-HH-5678","Red")
      pms.park("KA-01-HH-9876","Black")
      array = [{slot: 1, registration_number: "KA-01-HH-1234", colour: "White"},
        {slot: 2, registration_number: "KA-01-HH-5678", colour: "Red" }, {slot: 3, registration_number: "KA-01-HH-9876", colour: "Black"}]
        expect(pms.status).to match_array(array)
      end
    end

    context "#registration_numbers_for_cars_with_colour" do
      it "should retrun only cars" do
        pms = parking_lot_management_system.new()
        pms.create_parking_lot(5)
        pms.park("KA-01-HH-1234","White")
        pms.park("KA-01-HH-5678","Red")
        pms.park("KA-01-HH-8765","Black")
        pms.park("KA-01-HH-9876","Black")
        expect(pms.cars).to all(be_instance_of(Car))
      end

      it "should return registration_numbers for cars only with colour White" do
        pms = parking_lot_management_system.new()
        pms.create_parking_lot(5)
        pms.park("KA-01-HH-1234","White")
        pms.park("KA-01-HH-5678","Red")
        pms.park("KA-01-HH-8765","Black")
        pms.park("KA-01-HH-9876","Black")
        expect(pms.registration_numbers_for_cars_with_colour("White")).to eq "KA-01-HH-1234"
      end

      it "should return registration_numbers for cars only with colour Black" do
        pms = parking_lot_management_system.new()
        pms.create_parking_lot(5)
        pms.park("KA-01-HH-1234","White")
        pms.park("KA-01-HH-5678","Red")
        pms.park("KA-01-HH-9876","Black")
        pms.park("KA-01-HH-8765","Black")
        expect(pms.registration_numbers_for_cars_with_colour("Black")).to eq "KA-01-HH-9876, KA-01-HH-8765"
      end

      it "should return 'Not found' if the car colour is not present" do
        pms = parking_lot_management_system.new()
        pms.create_parking_lot(5)
        pms.park("KA-01-HH-1234","White")
        pms.park("KA-01-HH-5678","Red")
        expect(pms.registration_numbers_for_cars_with_colour("Black")).to eq 'Not found'
      end
    end

    context "#slot_numbers_for_cars_with_colour" do
      it "should return all slot numbers only for cars with colour" do
        pms = parking_lot_management_system.new()
        pms.create_parking_lot(5)
        pms.park("KA-01-HH-1234","White")
        pms.park("KA-01-HH-5678","Red")
        pms.park("KA-01-HH-9876","Black")
        pms.park("KA-01-HH-8765","Black")
        expect(pms.slot_numbers_for_cars_with_colour("Black")).to eq '3,4'
      end

      it "should return 'Not found' if the car colour is not present" do
        pms = parking_lot_management_system.new()
        pms.create_parking_lot(5)
        pms.park("KA-01-HH-1234","White")
        pms.park("KA-01-HH-5678","Red")
        expect(pms.slot_numbers_for_cars_with_colour("Black")).to eq 'Not found'
      end
    end

    context "#slot_number_for_registration_number" do
      it "should return the slot number for the car with registration number" do
        pms = parking_lot_management_system.new()
        pms.create_parking_lot(5)
        pms.park("KA-01-HH-1234","White")
        pms.park("KA-01-HH-5678","Red")
        pms.park("KA-01-HH-9876","Black")
        pms.park("KA-01-HH-8765","Black")
        expect(pms.slot_number_for_registration_number("KA-01-HH-9876")).to eq 3
      end

      it "should return 'Not found' if the registration_number is not present" do
        pms = parking_lot_management_system.new()
        pms.create_parking_lot(5)
        pms.park("KA-01-HH-1234","White")
        expect(pms.slot_number_for_registration_number("KA-01-HH-9876")).to eq "Not found"
      end
    end

  end
