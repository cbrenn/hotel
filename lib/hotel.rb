require 'date'
require_relative 'reservation'
require 'awesome_print'
require 'pry'

module Admin
  class Hotel
    attr_reader :rooms

    def initialize(rooms)
      @rooms = Array.new(rooms)
    end

    def reserve_room(reservation)

      i = 0
      reservation_array = []


      until i == @rooms.length

        if @rooms[i] == nil
          @rooms[i] = []
          #add reservation in an array
          @rooms[i][0] = reservation
          reservation_array[i] = @rooms[i]
          i+=1
          #binding.pry
          next

        else
          #go through arrays and see if there is a room booked at that time and return it to a new array
          booked_during = @rooms[i].select {|reservations| reservation.checkin.between?(reservations.checkin, reservations.checkout-1) }

          if booked_during.length == 0
            @rooms[i] << reservation
            reservation_array[i] = @rooms[i]
            i += 1
          else
            i += 1
            # => true
          end

        end
        return reservation_array
      end

      if reservation.number_of_rooms > reservation_array.length    
        raise ArgumentError.new("There are no more rooms available on #{reservation.checkin}")
      end

    end

    #finds what reservations are on a specific date
    def specific_date_reserved(date)
      i = 0
      rooms_reserved_on = []

      until i == @rooms.length
        if @rooms[i] == nil
          i += 1
        else
          @rooms[i].each do |reservation|
            if reservation.overlap?(date, date) == true
              rooms_reserved_on << i
            end
          end

          i += 1

        end
      end
      #rooms_reserved_on.reject! { |cell| cell.empty? }
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
          i+=1
        else
          #for each room in the array
          #remove if it has a reservation
          #reject each room that returns a reservation from inner loop
          #index at

          #look at each array element room
          @rooms[i].each do |reservations|
            #look at each date in date array
            date.each do |date1|
              #is the date in the array during a
              #present reservation
              if date1.between?(reservations.checkin, reservations.checkout-1)
                i+=1
                break
              else
                #add room to available rooms
                available_rooms_range << i
                i+=1
                break
              end

            end
          end
        end

      end
      return available_rooms_range
    end


    def reserves_room_for_specific_date(start_date, ending_start_date, rooms)

      start_date = Date.parse(start_date)
      ending_start_date = Date.parse(ending_start_date)

      days = ending_start_date - start_date


      raise ArgumentError.new "Please select a valid start date." unless  (start_date > (Date.today - 1))

      raise ArgumentError.new "Please select a valid date range" unless (start_date < ending_start_date)

      date = []
      ((start_date)..(ending_start_date)).each do |date1|
        date << date1
      end

      i = 0
      temp_reservations = []
      date.each do
        checkin = date[i]
        checkout = date[i] + days
        temp_reservations[i] = Reservation.new(checkin.to_s, checkout.to_s, rooms)
        i +=1
      end

      temp_reservations.each do |reservation|
        begin
          reserve_room(reservation)
          break
        rescue
          next
        end
      end
    end


  end
end

# stregis = Hotel.new(20)
# murray = Reservation.new('2018-05-01', '2018-05-03', 3)
# # Smith = Reservation.new('2018-05-01', '2018-05-05',1)
# rapport = Reservation.new('2018-05-01', '2018-05-05',3)
# taproot = Reservation.new('2018-05-01', '2018-05-05',3)
#
# puts stregis.reserve_room(rapport)
# #puts stregis.reserve_room(murray)
# #puts stregis.reserve_room(taproot)
#
# #
# # puts stregis.block(taproot)
# # puts stregis.block(rapport)
# # puts stregis.block(murray)
# puts"stregis.rooms"
# ap stregis.rooms


#puts stregis.specific_date_reserved('2018-05-01')

#stregis.specific_date_range_available_rooms(taproot)

#stregis.reserves_room_for_specific_date('01-01-2019', '01-10-2019', 3, 1)
# until Smith.checkin == Smith.checkout
#   puts Smith.checkin.next_day(n)
#   n+=1
