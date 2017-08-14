require 'vehicle'

describe Vehicle, "#registration_number" do
  context "documenting the registration number and colour" do
    registration_number = "KA-01-HH-1234"
    colour = "White"
    vehicle = Vehicle.new(registration_number, colour)

    it "should accept the registration number" do
      expect(vehicle.registration_number).to eq(registration_number)
    end

    it "should accept the colour" do
      expect(vehicle.colour).to eq(colour)
    end
  end
end
