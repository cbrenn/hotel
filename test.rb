require 'date'
date_a = []

(Date.new(2012, 01, 01)..Date.new(2012, 01, 30)).to_a
end

puts date_a

Date.new(2012, 01, 01).upto(Date.new(2012, 01, 30)) do |date|
  # Do stuff with date
end



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
    room.select {|reservations|
       date.each {|date|return date}).between?(reservations.checkin, (reservations.checkout-1))
  }
  i += 1
