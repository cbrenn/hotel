require_relative 'spec_helper'

describe 'Hotel class' do
  describe 'initialize' do
    before do
      @waldorf = Admin::Hotel.new(20)
    end

    it "hotel has rooms added to it on initialization" do
      @astoria = Admin::Hotel.new(20)

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
      @waldorf = Admin::Hotel.new(20)
      @burray = Admin::Reservation.new('2018-05-01', '2018-05-05',1)
      @blurray = Admin::Reservation.new('2018-05-01', '2018-05-05',1)
    end

    it "takes a reservation and updates room" do
      @waldorf.reserve_room(@burray)
      @waldorf.rooms[0].length.must_equal 1
    end

    it "does not double book a room" do
      @waldorf.reserve_room(@burray)
      @waldorf.reserve_room(@blurray)

      @waldorf.rooms[0].length.must_equal 1
      @waldorf.rooms[1].length.must_equal 1
    end

    it "no more than the rooms that exist can be reserved on a specific date" do
      aldorf = Admin::Hotel.new(2)
      urray = Admin::Reservation.new('2018-05-01', '2018-05-05',1)

      proc {

        aldorf.reserve_room(urray)
        aldorf.reserve_room(urray)
        aldorf.reserve_room(urray)

      }.must_raise ArgumentError
    end

    it "can make a reservation on the same day as a checkout" do
      hilmorf = Admin::Hotel.new(20)
      hosier = Admin::Reservation.new('2018-05-01', '2018-05-05',1)
      bruiser = Admin::Reservation.new('2018-05-05', '2018-05-07',1)

      hilmorf.reserve_room(hosier)
      hilmorf.reserve_room(bruiser)

      hilmorf.rooms[0].length.must_equal 2
      hilmorf.rooms[1].must_be_nil
    end

    it "returns a list of reservations for a specific date" do
      stregis = Admin::Hotel.new(20)
      murray = Admin::Reservation.new('2018-05-01', '2018-05-02', 1)
      smith = Admin::Reservation.new('2018-05-01', '2018-05-05',1)
      rapport = Admin::Reservation.new('2018-05-01', '2018-05-05',1)

      stregis.reserve_room(murray)
      stregis.reserve_room(smith)
      stregis.reserve_room(rapport)

      stregis.specific_date_reserved('2018-05-03').length.must_equal 3
    end
  end
  describe "Wave 2 tests" do
    describe "returns array of available rooms for date range" do

      it "takes in a valid date range" do
        stregish = Admin::Hotel.new(20)

        proc {
          porta = Admin::Reservation.new('2017-05-01', '2017-05-05', 1)
          stregish.specific_date_range_available_rooms(porta)
        }.must_raise ArgumentError
      end

      it "returns all rooms if there are no resevations" do
        stregish = Admin::Hotel.new(20)
        port = Admin::Reservation.new('2018-05-01', '2018-05-05', 1)

        (stregish.specific_date_range_available_rooms(port)).length.must_equal 20
      end

      it "returns an array of the correct length for rooms depending on the reservations" do
        stregish = Admin::Hotel.new(20)

        iport = Admin::Reservation.new('2018-05-01', '2018-05-05', 1)
        uport = Admin::Reservation.new('2018-05-01', '2018-05-05', 1)
        weport = Admin::Reservation.new('2018-05-01', '2018-05-05', 1)


        after_reservations = stregish.specific_date_range_available_rooms(iport).length - 3

        stregish.reserve_room(iport)
        stregish.reserve_room(uport)
        stregish.reserve_room(weport)

        stregish.specific_date_range_available_rooms(weport).length.must_equal after_reservations
      end

      describe 'reserves room for specific date' do

        it 'takes in valid dates for reservation' do
          stregish = Admin::Hotel.new(20)

          proc {
            stregish.reserves_room_for_specific_date('05-05-2017', '05-05-2017', 1)
          }.must_raise ArgumentError
        end

        it "finds first available room" do
          stregish = Admin::Hotel.new(20)
          stregish.reserves_room_for_specific_date('01-01-2019', '01-10-2019', 1)

          puts stregish.rooms

          stregish.specific_date_reserved('01-01-2019').length.must_equal 1

        end

      end
    end
  end

end
