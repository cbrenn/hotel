v
create block of rooms

n
block of rooms(date range, collection of rooms, discount room rate)
returns a collection of rooms
rooms is then a block
does block have rooms available_rooms_range
reserve room from within a block of rooms
max 5 rooms

reservation matches date range of the block


Part 1 block in hotel class
xtest- can create a block of rooms
xtest- number of rooms is the length of the block
xtest- can create a unique block of rooms
xtest- block is no larger than 5 rooms

test - can find enough rooms for block

test - returns error if not enough rooms for block
test - can access set aside rooms for block

test - room can not be reserved if has block

is a reservation or is a block


Part 2 reserves rooms from block
test- can create reservation from block
test - can say if any rooms in block are available
test - can say how many rooms in block are reserved

subclass of reservation - then can run cost and reserve on it


room block
reservation within block
make a block


reserve room

range piece inside of reservation

class res

def overlap?(proposed cin, proposed cout)
compare self.cin cout
end

update linked in alan work

hotel
def find_room(cin, cout)
@reservations.each do |res|
if res.overlap == true
eslse
reserve


unavailable_rooms = []

what if all the rooms are in a block

all rooms are in block 0
time/date issue
where is this assigned if all rooms have time/date assigned already
