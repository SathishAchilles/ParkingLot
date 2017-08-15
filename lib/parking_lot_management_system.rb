require 'parking_lot'
require 'car'

#brings abstractnes to the outside world
class ParkingLotManagementSystem

  def initialize
    @parking_lot = ParkingLot.new()
  end

  def create_parking_lot(no_of_slots)
    return false unless no_of_slots
    @parking_lot.slots = no_of_slots
  end

  def park(vehicle=Car,registration_number,colour)
    return "Sorry, parking lot is full" if @parking_lot.full?
    @parking_lot.allocate_slot(vehicle.new(registration_number,colour))
  end

  #TODO: try to meta program it as helpers module
  def registration_numbers_for_cars_with_colour(colour)
    vehicles = (@parking_lot.allocated_slots.select do |slot|
      vehicle = slot.vehicle
      vehicle.registration_number if vehicle.colour == colour
    end)
    return "Not Found" unless vehicles
    vehicles.map(&:registration_number).join(', ')
  end

  #TODO: try to meta program it as helpers module
  def slot_numbers_for_registration_number(registration_number)
    slot_numbers = @parking_lot.allocated_slots.select{
      |slot| slot.vehicle.registration_number == registration_number }
      return "Not Found" unless slot_numbers or slot_numbers.empty?
    end

  end
