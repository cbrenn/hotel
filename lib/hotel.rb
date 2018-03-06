require 'date'
require_relative 'reservation'
require 'awesome_print'

class Hotel
  attr_reader :rooms

  def initialize(rooms)
    @rooms = Array.new(rooms)
  end

  def reserve_room(reservation)
    i = 0
    until i == @rooms.length
      if @rooms[i] == nil
        @rooms[i] = []
        #add reservation in an array
        @rooms[i][0] = reservation
        return
      else
        #go through arrays and see if there is a room booked at that time and return it to a new array
        booked_during = @rooms[i].select {|reservations| reservation.checkin.between?(reservations.checkin, reservations.checkout)  }

        if booked_during.length == 0
          @rooms[i] << reservation
          return
        else
          puts"*********** booked during #{booked_during.to_s}"
          i += 1
          # => true
        end
      end
    end

    raise ArgumentError.new("There are no more rooms available on #{reservation.checkin}")
  end
end



# Murray = Reservation.new('2017-01-01', '2017-01-05')
# Smith = Reservation.new('2017-03-01', '2017-03-05')
# Rapport = Reservation.new('2017-03-01', '2017-03-05')
# # puts Murray.checkin
# # puts Murray.checkout
# # puts Murray.number_of_rooms
#
# stregis = Hotel.new(20)
#
# # puts stregis.rooms
#
# # stregis.reserve_room(Murray)
# # ap stregis.rooms
# ap stregis.reserve_room(Smith)
# ap stregis.rooms
# ap stregis.reserve_room(Rapport)
