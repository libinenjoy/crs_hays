module Reservations
  class CreateService < Reservations::BaseService

    def execute!
      reservation = Reservation.new(@params)
      if reservation.valid?
        reservation.save
        success("Reservation Created Successfully", 201)
      else
        error(reservation.errors.full_messages, 400)
      end
    end
  end
end
