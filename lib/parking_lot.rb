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
      (ParkingLayout::ENTRY_POINT...no_of_slots).each{|slot|
        @slots << ParkingSlot.new(slot+ParkingLayout::INCREASING_STEP)
      }
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
    available_slots.sort_by(&:number).first.allocate(vehicle) rescue nil
  end

  def allocated_slots
    @slots.select{|slot| !slot.available }
  end

  def deallocate_slot(number)
    slot = allocated_slots.find{|slot| slot.number == number }
    return false unless slot
    slot.deallocate
  end

  def full?
    available_slots.empty?
  end
end
