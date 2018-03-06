
require 'date'

class Reservation
  attr_reader :checkin, :checkout, :number_of_rooms

  def initialize(checkin,checkout, number_of_rooms:1)
    
    @checkin = Date.parse(checkin)
    @checkout = Date.parse(checkout)
    @number_of_rooms = number_of_rooms
  end


end
