require_relative 'spec_helper'

describe 'Hotel class' do
  describe 'initialize' do
    before do
      @waldorf = Hotel.new(20)
    end

    it "hotel has rooms added to it on initialization" do
      @astoria = Hotel.new(20)

      @astoria.rooms.length.must_equal 20
    end

    it "hotel cannot access a room that does not exist" do
      @waldorf.rooms[21]
    end

    it "hotel can have empty room" do
      @waldorf.rooms[1].must_be_nil
    end
  end

  describe 'reserve_room method' do
    before do
      @waldorf = Hotel.new(20)
    end

    it "takes a reservation and updates room" do
      dorf = Hotel.new(20)
      Burray = Reservation.new('2018-05-01', '2018-05-05')
      dorf.reserve_room(Burray)

      dorf.rooms[0].length.must_equal 1
    end

    it "does not double book a room" do
      ldorf = Hotel.new(20)
      Blurray = Reservation.new('2018-05-01', '2018-05-05')
      Bluray = Reservation.new('2018-05-01', '2018-05-05')
      ldorf.reserve_room(Bluray)
      ldorf.reserve_room(Blurray)

      ldorf.rooms[0].length.must_equal 1
      ldorf.rooms[1].length.must_equal 1
    end

    it "no more than the rooms that exist can be reserved on a specific date" do
      aldorf = Hotel.new(2)
      urray = Reservation.new('2018-05-01', '2018-05-05')

      proc {

          aldorf.reserve_room(urray)
          aldorf.reserve_room(urray)
          aldorf.reserve_room(urray)

      }.must_raise ArgumentError
    end

    it "can make a reservation on the same day as a checkout" do
      hilmorf = Hotel.new(20)
      Hosier = Reservation.new('2018-05-01', '2018-05-05')
      Bruiser = Reservation.new('2018-05-05', '2018-05-07')

      hilmorf.reserve_room(Hosier)
      hilmorf.reserve_room(Bruiser)

      hilmorf.rooms[0].length.must_equal 2
      hilmorf.rooms[1].must_be_nil
    end

  end
end
