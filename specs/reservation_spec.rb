require_relative 'spec_helper'

describe "Reservation class" do
before do
 Murray = Reservation.new('2017-01-01', '2017-01-05')
end

 it "creates an accurate reservation" do
   Murray.checkin.must_equal Date.parse('2017-01-01')
   Murray.checkout.must_equal Date.parse('2017-01-05')
   Murray.number_of_rooms.must_equal 1
 end

end
