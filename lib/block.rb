require_relative 'hotel.rb'

module Admin
  class Block < Reservation
  attr_reader :reserved, :blockname
  attr_accessor :reserve
    #
    def initialize(checkin, checkout, number_of_rooms, reserve, blockname)
      super(checkin,checkout,number_of_rooms)
      @reserve = reserve
      @blockname = blockname
    end


    # if @number_of_rooms > 5
    #   raise ArgumentError.new "We can only accomodate blocks of up to 5 rooms."
    # end

    raise ArgumentError.new "We can only accomodate blocks of up to 5 rooms." unless (@number_of_rooms > 5)


    def find_block_rooms(blockname)

    end

    def cost
      sub_total = super

      total = sub_total * 0.85
      return total
    end


  end
end

maddow = Admin::Block.new('01-01-2019', '01-03-2019', 4, false, 'maddow')

puts maddow.checkin
#puts block1 = Admin::Block.new(maddow)
puts maddow.number_of_rooms


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
