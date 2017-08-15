require_relative 'parking_layout'

#class for the individual parking slots present within the parking lot
class ParkingSlot
  @@distance_from_the_entry_point = ParkingLayout::ENTRY_POINT
  attr_accessor :available

  def initialize(entry_point=nil)
    @@distance_from_the_entry_point = entry_point if entry_point
    set_number
    @available = true
    @vehicle = nil
  end

  def number
    @number
  end

  def allocate(vehicle)
    @vehicle = vehicle
    @available = false
    number
  end

  def allocated_vehicle?
    @vehicle
  end

  protected
  def set_number
    @number = (@@distance_from_the_entry_point += ParkingLayout::INCREASING_STEP)
  end
end
