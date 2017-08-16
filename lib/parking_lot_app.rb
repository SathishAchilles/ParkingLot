#!/usr/bin/env ruby
require_relative 'parking_lot_management_system'
require_relative 'errors/input'

class ParkingLotApp
  include ParkingLotManagementSystem

  def run
    file = ARGV[0]
    if file
      unless File.file?(file)
        puts "file error"
        return
      end
      execute_commands_from_file(file)
    else
      execute_commands_from_command_line
    end
  end

  def execute_commands_from_file(file)
    File.open(file,'r') do |lines|
      lines.each do |line|
        try_and_execute_command(line.chomp)
      end
    end
  end

  def execute_commands_from_command_line
    begin
      puts "Input:"
      input = gets.chomp()
      #TODO: find a better way to do this
      case input.downcase
      when "exit"
        raise Input::Exit
      when "status"
        addon_dialogue = " (tab delimited output)"
      else
        addon_dialogue = nil
      end
      puts "\nOutput#{addon_dialogue}:"
      try_and_execute_command(input)
      puts "\n"
      raise Input::Retry
    rescue Input::Retry
      retry
    rescue Input::Exit, SystemExit, Interrupt
      puts "Existing.."
    rescue NameError, NoMethodError
      puts "Command not found"
      retry
    rescue Exception
      retry
    end
  end

  #Not sure if am allowed to use OptionParser
  def try_and_execute_command(command)
    command_array = command.split(' ')
    method_name = command_array.shift
    args = ""
    command_array.each{|k| args << "'#{k}',"}
    args.chomp!(',')
    output = eval("#{method_name.downcase}(#{args})")
    puts output if output
  end
end

if __FILE__ == $0
  ParkingLotApp.new.run
end
