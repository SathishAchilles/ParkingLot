require_relative 'parking_slot'
#Implements the parking lot
class ParkingLot

  def initialize
    @slots = []
  end

  def slots
    @slots
  end

  def slots=(no_of_slots)
    begin
      raise ArgumentError unless no_of_slots.is_a?(Integer)
      @slots = Array[ParkingSlot.new] * (no_of_slots || 0)
    rescue ArgumentError => e
      e.backtrace
      @slots = []
    rescue Exception => e
      e.backtrace
      @slots = []
    end
  end
end
