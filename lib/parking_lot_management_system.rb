require_relative 'parking_lot'
require_relative 'car'

#brings abstractnes to the outside world
module ParkingLotManagementSystem

  def initialize
    @parking_lot = ParkingLot.new()
  end

  def create_parking_lot(no_of_slots)
    return false unless no_of_slots
    @parking_lot.slots = no_of_slots
    return "Created a parking lot with #{@parking_lot.slots.count} slots"
  end

  def park(vehicle=Car,registration_number,colour)
    return "Sorry, parking lot is full" if @parking_lot.full?
    number = @parking_lot.allocate_slot(vehicle.new(registration_number,colour))
    return "Allocated slot number: #{number}"
  end

  def leave(slot)
    slot = slot.to_i
    if @parking_lot.deallocate_slot(slot)
      return "Slot number #{slot} is free"
    else
      return "Unable to free space"
    end
  end

  def status
    status = []
    @parking_lot.allocated_slots.each do |slot|
      status_val = {}
      status_val[:slot] = slot.number
      status_val[:registration_number] = slot.vehicle.registration_number
      status_val[:colour] = slot.vehicle.colour
      status << status_val
    end
    decorate_status(status)
  end

  def decorate_status(status)
    puts status.first.keys.join("\t")
    status.each{|k| puts k.values.join("\t")}
    nil
  end

  #TODO: try to meta program it as helpers module
  def registration_numbers_for_cars_with_colour(colour)
    cars_with_colour = cars.select{|car| car.colour == colour }
    return "Not found" if cars_with_colour.empty?
    cars_with_colour.map(&:registration_number).join(', ')
  end

  def slot_numbers_for_cars_with_colour(colour)
    slot_numbers = []
    @parking_lot.allocated_slots.each do |slot|
      slot_numbers << slot.number if (slot.vehicle.is_a?(Car) && (slot.vehicle.colour == colour))
    end
    return "Not found" if slot_numbers.empty?
    slot_numbers.join(',')
  end

  #TODO: try to meta program it as helpers module
  def slot_number_for_registration_number(registration_number)
    slot = @parking_lot.allocated_slots.find{|slot| (slot.vehicle.is_a?(Car) && (slot.vehicle.registration_number == registration_number)) }
    return "Not found" unless slot
    slot.number
  end

  def cars
    cars = []
    @parking_lot.allocated_slots.each do |slot|
      cars << slot.vehicle if slot.vehicle.is_a?(Car)
    end
    cars
  end

end
