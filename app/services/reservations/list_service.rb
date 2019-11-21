module Reservations
  class ListService < Reservations::BaseService
    include DateHelper

    def execute!
      @reservations = Reservation.reserved_between(parsed_params[:start_date], parsed_params[:end_date]).order(:reserved_on)
      if !@reservations.empty?
        to_api
      else
        "No records found!".to_json
      end
    end

    private
    def parsed_params
      _params = @params.dup

      _params[:start_date] = format_start_datetime(_params[:start_date])
      _params[:end_date] = format_end_datetime(_params[:end_date])

      _params
    end

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
end
