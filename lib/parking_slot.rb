require_relative 'parking_layout'

#class for the individual parking slots present within the parking lot
class ParkingSlot
  attr_accessor :available, :number

  def initialize(number)
    @available = true
    @vehicle = nil
    @number = number
  end

  def allocate(vehicle)
    @vehicle = vehicle
    @available = false
    number
  end

  def allocated?
    @vehicle
  end

  def deallocate
    @vehicle = nil
    @available = false
    true
  end
end
