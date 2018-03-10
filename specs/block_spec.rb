require_relative 'spec_helper'

describe "Wave 3 tests" do
  it "can take in reader methods from reservation" do

    maddow = Admin::Block.new('01-01-2019', '01-03-2019', 4, 0, 'Maddow')

    maddow.number_of_rooms.must_equal 4
  end

  it "a can amend the reservation cost method" do
    maddow = Admin::Block.new('2019-01-01', '2019-01-03',1, 0, 'Maddow')
    maddow.cost.must_equal 340
  end

  it "the rooms can be reserved as blocks" do
    streisha = Admin::Hotel.new(25)
    maddow = Admin::Block.new('01-01-2019', '01-03-2019', 4, 0, "maddow")
    streisha.reserve_room(maddow)

    streisha.rooms[0].length.must_equal 1
    streisha.rooms[1].length.must_equal 1
    streisha.rooms[2].length.must_equal 1
    streisha.rooms[3].length.must_equal 1
  end

  # it "can not take in a block of more than five rooms" do
  #   streisha = Admin::Hotel.new(6)
  #   maddow = Admin::Block.new('2019-06-01', '2019-06-05', 7, 0,'maddow')
  #   puts maddow.number_of_rooms
  #   # proc {
  #   #   streisha.reserve_room(maddow)
  #   # }.must_raise ArgumentError
  # end


  # it "the number of rooms is the length of the block array" do
  #   streisha = Admin::Hotel.new(25)
  #   maddow = Admin::Block.new('01-01-2019', '01-03-2019', 4, 0, "maddow")
  #   streisha.block(maddow).length.must_equal 4
  # end
  #

  # it "can create a unique block of rooms" do
  #   streish = Hotel.new(20)
  #   maddow = Reservation.new('01-01-2019', '01-03-2019', 4)
  #   streisand = Reservation.new('01-01-2019', '01-03-2019', 4)
  #   block1 = streish.block(maddow)
  #   block2 = streish.block(streisand)
  #
  #   block1.object_id.wont_equal block2.object_id
  # end
  #
  # it "can find enough rooms for a block" do
  # end
  #returns rooms reserved from rooms reserved method



end
