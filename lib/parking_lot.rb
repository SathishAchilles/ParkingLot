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
      (no_of_slots || 0).times{ @slots << ParkingSlot.new }
    rescue ArgumentError => e
      e.backtrace
      @slots = []
    rescue Exception => e
      e.backtrace
      @slots = []
    end
  end

  def available_slots
    @slots.select{|slot| slot.available }
  end

  def allocate_slot(vehicle)
    available_slots.sort_by(&:number).first.allocate(vehicle)
  end
end
