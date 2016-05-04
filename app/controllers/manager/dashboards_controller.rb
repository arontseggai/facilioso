class Manager::DashboardsController < ApplicationController

  def show
    @booking = Booking.new
    @apartments = Apartment.all
  end
end
