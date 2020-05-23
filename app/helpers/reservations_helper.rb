module ReservationsHelper
  def target_reservation
    @target_reservation ||= Reservation.find_by(id: session[:reservation_id])
  end
end
