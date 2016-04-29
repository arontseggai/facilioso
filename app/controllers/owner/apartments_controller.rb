class Owner::ApartmentsController < ApplicationController
  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.new(apartment_params)

    if @apartment.valid?
      @apartment.save
      redirect_to owner_dashboard_path
    else
      render "new"
    end
  end

  private
  def apartment_params
    params.require(:apartment).permit(:street, :city, :user_id)
  end
end
