require 'spec_helper'
RSpec.describe Reservation, type: :model do
  include DateHelper

  describe "associations" do
    it { is_expected.to have_many_to_one :movie }
  end

  describe "validations" do
    it { is_expected.to validate_presence :username }
    it { is_expected.to validate_presence :reserved_on }
    it { is_expected.to validate_presence :no_of_seats }
    it { is_expected.to validate_presence :movie_id }
  end

  describe "custom validations" do
    before(:each) do
      movie = build(:movie, name: "Lord of the rings")
      movie.save
      @reservation = FactoryBot.build(:reservation, {movie_id: movie.id, reserved_on: movie.presented_on})
    end

    it 'should have invalid movie' do
      @reservation.movie_id = 0
      @reservation.valid?
      expect(@reservation.errors.full_messages).to eq(["movie_id is Invalid"])
    end

    it 'should have invalid reserved_on' do
      @reservation.reserved_on = "2019-10-20"
      @reservation.valid?
      expect(@reservation.errors.full_messages).to eq(["reserved_on is Invalid"])
    end

    it 'should have invalid seating capacity' do
      @reservation.no_of_seats = 11
      @reservation.valid?
      expect(@reservation.errors.full_messages).to eq(["no_of_seats reached the max capacity"])
    end

  end
end
