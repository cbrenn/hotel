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
1. Hotel Class
2. test - hotel has rooms
3. initialize rooms
4. test - hotel has 20 rooms
5. test - hotel has no more than 20 rooms
6. test - hotel can't have room with no name
7. test - room can be empty

Part3
1. Reservation Class
2. test - can access hotel rooms
3. test - can create reservation
4. initialize method (checkin, checkout, number of rooms)

Part 4 reserve method in Hotel
1. test - reservation takes in information from Reservation instance (input)
2. test -reservation can be made on room
3. test- reservation updates hotel rooms
4. test - reservation is not made on day when room is unavailable
  4a.raises exception when asked to reserve unavailable room
5. test- no more than 20 rooms can be reserve
5. reserve method(checkin, checkout, number of rooms)
  5a. if room is empty reserve, else check reservations for date
  5b. no more than 20 rooms can be reserved


Part 5 - cost of room in Reservation class
1. cost constant
2. test - cost does not change
3. test -can return cost
4. cost method (checkin, checkout, number of rooms= 1)
5. test - block of rooms can be reserved











end with blocks of rooms
