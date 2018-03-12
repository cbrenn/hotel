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
      reservation_made = 0


      until i == @rooms.length || reservation_made == reservation.number_of_rooms

        if @rooms[i] == nil
          @rooms[i] = []
          @rooms[i][0] = reservation
          reservation_array[i] = @rooms[i]
          reservation_made += 1
        else
          booked_during = @rooms[i].select {|reservations| reservation.checkin.between?(reservations.checkin, reservations.checkout-1) }

          if booked_during.length == 0
            @rooms[i] << reservation
            reservation_array[i] = @rooms[i]
            reservation_made += 1
          end
        end
        i += 1
      end


      if reservation.number_of_rooms > reservation_array.length
        raise ArgumentError.new("There are no more rooms available on #{reservation.checkin}")
      end

    end

    def reserve_block_room(blockid_to_check, number_of_rooms_to_reserve)
      i = 0
      reservation_made = 0
      until i == @rooms.length || reservation_made == number_of_rooms_to_reserve
        if @rooms[i] == nil
          i += 1
        else
          @rooms[i].each do |reservation|
            if reservation.blockname == blockid_to_check && reservation.reserve == false
              puts "here"
              reservation.reserve = true
              reservation_made += 1
            end
          end
          i += 1
        end
      end

    end


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
      return rooms_reserved_on
    end

    def specific_date_range_available_rooms(reservation)
      date = []
      ((reservation.checkin)..(reservation.checkout-1)).each do |date1|
        date << date1
      end

      i = 0
      available_rooms_range = []

      until i == @rooms.length
        if @rooms[i] == nil
          available_rooms_range << i
          i+=1
        else
          @rooms[i].each do |reservations|
            date.each do |date1|
              if date1.between?(reservations.checkin, reservations.checkout-1)
                i+=1
                break
              else
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

      temp_reservations = temp_reservations_array(start_date, ending_start_date, days, rooms)


      reserved = 0
      until reserved == rooms
        temp_reservations.each do |reservation|
          begin
            reserve_room(reservation)
            reserved +=1
            break
          rescue
            next
          end
        end
      end
    end

    def temp_reservation(checkin, checkout, rooms)
      Reservation.new(checkin, checkout ,rooms)
    end

    def temp_reservations_array(start_date, ending_start_date, days, rooms)
      date = []
      ((start_date)..(ending_start_date)).each do |date1|
        date << date1
      end


      i = 0
      temp_reservations = []
      date.each do
        checkin = date[i].to_s
        checkout = (date[i] + days).to_s
        temp_reservations[i] = temp_reservation(checkin, checkout, rooms)
        i +=1
      end
      return temp_reservations
    end





    def find_block_rooms_by_reservation(reservation)
      i = 0
      block_array = []
      until i == rooms.length
        if @rooms[i] == nil
          @rooms[i] = []
        else
          block_array << @rooms[i].select {|reservations| reservations.blockname == reservation.blockname
          }
        end
        i += 1
      end
      return block_array
    end

    def find_block_rooms_by_room_number(reservation)
      i = 0
      block_array_rooms = []
      until i == rooms.length
        if @rooms[i] == nil
          @rooms[i] = []
        else
          @rooms[i].each do|reservations|
            if reservations.blockname == reservation.blockname
              block_array_rooms << i
            end
          end
        end
        i += 1
      end
      return block_array_rooms
    end

  end
end
