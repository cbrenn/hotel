
require 'date'
require 'pry'

module Admin

  class Reservation
    attr_reader :checkin, :checkout, :number_of_rooms

    ROOM_COST = 200

    def initialize(checkin ,checkout, number_of_rooms)

      @checkin = Date.parse(checkin)
      @checkout = Date.parse(checkout)
      @number_of_rooms = number_of_rooms


      raise ArgumentError.new "Please select a valid start date." unless  (@checkin > (Date.today() - 1))

      raise ArgumentError.new "Please select a valid date range" unless (@checkin < @checkout)
    end

    def cost
      sub_cost = ROOM_COST * number_of_rooms
      length_of_stay = checkout - checkin
      total_cost = length_of_stay.to_f * sub_cost
      return total_cost
    end

    def overlap?(proposedcheckin, proposedcheckout)

      #return false
      return true if Date.parse(proposedcheckin) >= self.checkout || Date.parse(proposedcheckin) <=self.checkout
    end




  end
end

# hosier = Reservation.new('2018-05-01', '2018-05-05', 1)
# #Sputs hosier.cost
# # puts Hosier.number_of_rooms
#
# puts hosier.overlap?('2018-05-01','2018-05-03')
