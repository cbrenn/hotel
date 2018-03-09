require_relative 'hotel.rb'

module Admin
  class Block < Hotel

    def initialize(reservation)
      @reservation = reservation
    end

    unless reservation.number_of_rooms < 5
      raise ArgumentError.new "We can only accomodate blocks of up to 5 rooms."
    end

  end
end

maddow = Admin::Reservation.new('01-01-2019', '01-03-2019', 4)

puts block1 = Admin::Block.new(maddow)



#block_rooms = []
#
#
#
#     #need to change to accept multiple rooms
#     #returns array of availble rooms
#     block_rooms = specific_date_range_available_rooms(reservation)
#
#
#     block_rooms = block_rooms.first(reservation.number_of_rooms)
#
#
#     return block_rooms
#   end
#
#   def reserve_block_rooms(block_rooms)
#     #return rooms reserved
#   end
#
#   def block_rooms_status
#     #returns how many rooms are reserved
#     #returns how many rooms are available
#   end
#
# end
