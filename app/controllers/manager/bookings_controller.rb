class Manager::BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)

    if @booking.save

      redirect_to '/manager/dashboard'
    else
      redirect_to "/manager/dashboard#CreateBooking"
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:apartment_id, :invoice_id, :amount, :expected_arrival, :expected_departure, :notes)
  end
end
