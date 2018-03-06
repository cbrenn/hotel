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
        booked_during = @rooms[i].select {|reservations| reservation.checkin.between?(reservations.checkin, reservations.checkout-1)  }

        if booked_during.length == 0
          @rooms[i] << reservation
          return
        else
          i += 1
          # => true
        end
      end
    end

    raise ArgumentError.new("There are no more rooms available on #{reservation.checkin}")
  end

  def specific_date_reserved(date)
    i = 0
    rooms_reserved_on = []
    date = Date.parse(date)
    until i == @rooms.length
      if @rooms[i] == nil
        i += 1
      else
        rooms_reserved_on[i]= @rooms[i].select {|reservations| date.between?(reservations.checkin, (reservations.checkout-1))  }
        i += 1
      end
    end

    rooms_reserved_on.reject! { |cell| cell.empty? }

    return rooms_reserved_on
  end

  def specific_date_range(checkin, checkout)
    i = 0
    available_rooms_range = []
    until i == @rooms.length
      if @rooms[i] == nil
        available_rooms_range << i
      else
        rooms_reserved_on[i]= @rooms[i].select {|reservations| date.between?(reservations.checkin, (reservations.checkout-1)) == false }
        i += 1

      end
    end


  end



end


stregis = Hotel.new(20)
Murray = Reservation.new('2018-05-01', '2018-05-03', 1)
Smith = Reservation.new('2018-05-01', '2018-05-05',1)
Rapport = Reservation.new('2018-05-01', '2018-05-05',1)
# # puts Murray.checkin
# # puts Murray.checkout
# # puts Murray.number_of_rooms
#

#
# # puts stregis.rooms
#
stregis.reserve_room(Murray)
stregis.reserve_room(Smith)
ap stregis.reserve_room(Rapport)

ap stregis.specific_date_reserved('2018-05-03')
