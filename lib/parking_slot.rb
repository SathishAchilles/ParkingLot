require_relative 'parking_layout'

#class for the individual parking slots present within the parking lot
class ParkingSlot
  @@distance_from_the_entry_point = ParkingLayout::ENTRY_POINT

  def initialize
    set_number
  end

  def number
    @number
  end

  protected
  def set_number
    @number = (@@distance_from_the_entry_point += ParkingLayout::INCREASING_STEP)
  end
end
