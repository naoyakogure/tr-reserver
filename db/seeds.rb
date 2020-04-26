(1..4).each do |number|
  Reservation.create(date: 20200406 + number, place: 'L-room')
end