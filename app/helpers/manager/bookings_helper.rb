module Manager::BookingsHelper

  def bookings_today
    Booking.where('DATE(expected_arrival) = ?', Date.today)
  end

  def bookings_tomorrow
    Booking.where('DATE(expected_arrival) = ?', Date.today + 1)
  end

  def bookings_after_tomorrow
    Booking.where('DATE(expected_arrival) = ?', Date.today + 2)
  end

  def checkout_today
    Booking.where('DATE(expected_departure) = ?', Date.today)
  end

  def after_tomorrow
    (Date.today + 2).strftime("%A")
  end
end
