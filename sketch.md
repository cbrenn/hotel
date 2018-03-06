WAVE 1

noun

list of rooms

hotel

list of reservations

specific date
total cost
reservation
room
guest
number of guests




verb
build
access
total
reserve

CLASS HOTEL - booking system
initialize
room = []

room if empty then no {reservations}
date range(exclusive or inclusive)(sort by date, most recent reservations first?
  tomorrow.between?(today, one_month_later))


CLASS RESERVATION
attributes
checkin date = date class
checkout date = date class
cost

return rooms for that date range
avaialable rooms << available


tests
if room is empty return nil
if room is not empty do not return nil
can reserve a room
can not reserve a room that does not exist


Writing steps:
Part1
1.Pre-Rakefile etc

Part2
x1. Hotel Class
test -it exists
x2. test - hotel has rooms, adds rooms to hotel
x3. initialize with rooms
x4. test - hotel has 20 rooms
method - adds rooms
5. test - hotel has no more than 20 rooms
6. test - hotel can't have room with no name
x7. test - room can be nil

Part3
x1. Reservation Class
2. test - can access hotel rooms
x3. test - can create reservation
x4. initialize method (checkin, checkout, number of rooms)

Part 4 reserve method in Hotel
x1. test - reservation takes in information from Reservation instance (input)
x2. test -reservation can be made on room
x3. test- reservation updates hotel rooms
x4. test - reservation is not made on day when room is unavailable
  x4a.raises exception when asked to reserve unavailable room
x5. test- no more than 20 rooms can be reserved
x6. reserve method(checkin, checkout, number of rooms)
  x5a. if room is empty reserve, else check reservations for date
  x5b. no more than 20 rooms can be reserved
x7. test- can not reserve a date in the past
x8. test - checkout is after check in
x9.test - can reserve room on same day as checkout


Part 5 - cost of room in Reservation class
x1. cost constant
x2. test - cost does not change
x3. test -can return cost
x4. cost method number_of_rooms and C cost


Part 6 - access list of rooms for specific date
x1. test - returns a list of reservations
2. test - reservation are on the date provided


Part 7
1. test - block of rooms can be initialized in reservation
2. test - block of rooms can be reserved in hotel class
3.

Wave 1 reqs
DONE As an administrator, I can access the list of all of the rooms in the hotel
hotel.rooms

DONE As an administrator, I can reserve a room for a given date range
checkin, checkout

DONE As an administrator, I can access the list of reservations for a specific date
yes, not the rooms the reservations

DONE As an administrator, I can get the total cost for a given reservation
yes cost method 


when you reserve - try to keep everything in one room
https://stackoverflow.com/questions/4521921/how-to-know-if-todays-date-is-in-a-date-range

rooms.each
room.select { |range|  reservation.between? date date  }
do






end with blocks of rooms
