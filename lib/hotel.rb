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

  #finds what reservations are on a specific date
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


  #finds what rooms are available in date range
  #s
  def specific_date_range_available_rooms(reservation)
    date = []
    ((reservation.checkin)..(reservation.checkout-1)).each do |date1|
      date << date1
    end

    i = 0
    available_rooms_range = []

    until i == @rooms.length
      if @rooms[i] == nil
        #accounts translating index to 1 based system
        available_rooms_range << i
        #puts 'here'
        i+=1
      else
        #adds to available_rooms_range array
        available_rooms_range <<
        #for each room in the array
        #remove if it has a reservation
        #reject each room that returns a reservation from inner loop
        #index at
        @rooms.reject!{|room|
          #if there is a reservation on that date, select and add to array
          #this returns a room object
          room.select {|reservations| (date{|date|return date}).between?(reservations.checkin, (reservations.checkout-1))
        }
        i += 1
      }
    end

  end
  ap available_rooms_range
end
end

stregis = Hotel.new(20)
Murray = Reservation.new('2018-05-01', '2018-05-03', 1)
Smith = Reservation.new('2018-05-01', '2018-05-05',1)
Rapport = Reservation.new('2018-05-01', '2018-05-05',1)
Taproot = Reservation.new('2018-05-01', '2018-05-05',1)

stregis.specific_date_range_available_rooms(Taproot)

# until Smith.checkin == Smith.checkout
#   puts Smith.checkin.next_day(n)
#   n+=1
# end
# #
