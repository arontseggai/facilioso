class Manager::BookingsController < ApplicationController

  def create
    invoice = Invoice.create
    @booking = Booking.new(booking_params)
    @booking.invoice_id = invoice.id


    if @booking.save

      redirect_to '/manager/dashboard'
    else
      redirect_to "/manager/dashboard#CreateBooking"
    end
  end

  def booking_params
    params.require(:booking).permit(:apartment_id, :invoice_id, :amount, :expected_arrival, :expected_departure)
  end
end
