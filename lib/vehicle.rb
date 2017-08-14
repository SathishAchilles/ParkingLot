#acts as the super class for all vehicles
class Vehicle
  attr_accessor :registration_number, :colour

  def initialize(registration_number, colour)
    @registration_number = registration_number
    @colour = colour
  end

end
