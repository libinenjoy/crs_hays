class Reservation < Sequel::Model(:reservations)
  include DateHelper

  # Constants
  # TODO: we can move this to Setting
  SEATING_CAPACITY = 10

  # Association
  many_to_one :movie

  # Validations
  def validate
    super
    validates_presence [:username, :reserved_on, :no_of_seats, :movie_id]
    if validate_movie
      validate_reserved_on
      validate_seating_capacity
    end
  end

  def before_validation
    super
    set_movie
  end

  def validate_movie
    if valid_movie?
      true
    else
      errors.add(:movie_id, "is Invalid")
      false
    end

  end

  def validate_reserved_on
    errors.add(:reserved_on, "is Invalid") unless valid_reserved_on?
  end

  def validate_seating_capacity
    errors.add(:no_of_seats, "reached the max capacity") unless valid_seating_capacity?
  end

  def self.reserved_between(start_date, end_date)
    where(reserved_on: start_date..end_date)
  end

  private
  def set_movie
    unless movie_id.nil?
      @movie = Movie.where(id: movie_id).first
    end
  end

  def valid_movie?
    !@movie.nil?
  end

  def valid_reserved_on?
    format_date(@movie.presented_on) == format_date(reserved_on)
  end

  def valid_seating_capacity?
    (total_occupied_seats + no_of_seats) <= SEATING_CAPACITY
  end

  def total_occupied_seats
    @movie.reservations.sum{|r| r.no_of_seats}
  end

  #TODO: Move to JSON Builder
  def to_api
    @reservations.map do |reservation|
      {
          id: reservation.id,
          username: reservation.username,
          reserved_on: format_date(reservation.reserved_on),
          no_of_seats: reservation.no_of_seats,
          movie: {
              id: reservation.movie_id,
              name: reservation.movie.name
          }
      }
    end.to_json
  end
end
