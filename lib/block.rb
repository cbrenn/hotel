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

      if @number_of_rooms > 5
        raise ArgumentError.new "We can only accomodate blocks of up to 5 rooms."
      end
    end




    def cost
      sub_total = super

      total = sub_total * 0.85
      return total
    end
  end
end
