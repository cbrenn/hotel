
require 'date'

class Reservation
  attr_reader :checkin, :checkout, :number_of_rooms, :cost

  ROOM_COST = 200

  def initialize(checkin ,checkout, number_of_rooms:1)

    @checkin = Date.parse(checkin)
    @checkout = Date.parse(checkout)
    @number_of_rooms = number_of_rooms

        raise ArgumentError.new "Please select a valid start date." unless  (@checkin > (Date.today -1))

        raise ArgumentError.new "Please select a valid date range" unless (@checkin < @checkout)
  end

 def cost
   cost = ROOM_COST * number_of_rooms
 end
end

Hosier = Reservation.new('2018-05-01', '2018-05-05')
puts Hosier.cost
