require_relative 'spec_helper'

describe "Reservation class" do
before do
 Murray = Reservation.new('2018-05-01', '2018-05-05')
end

 it "creates an accurate reservation" do
   Murray.checkin.must_equal Date.parse('2018-05-01')
   Murray.checkout.must_equal Date.parse('2018-05-05')
   Murray.number_of_rooms.must_equal 1
 end

 it "must choose a start date after today" do
   proc {
 Samson = Reservation.new('2018-05-05', '2018 -05-01')
   }.must_raise ArgumentError
 end

 it "returns a cost for rooms reserved" do
   Hosier = Reservation.new('2018-05-01', '2018-05-05')
   Hosier.cost.must_equal 200

 end

end
