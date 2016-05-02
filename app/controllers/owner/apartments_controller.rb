class Owner::ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]

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

  def show
    set_apartment
  end

  def edit
    set_apartment
  end

  def update
    set_apartment
    @apartment.update(apartment_params)
    redirect_to owner_apartment_path(@aparment)
  end

  def destroy
    set_apartment
    @apartment.destroy
    redirect_to owner_dashboard_path
  end

  private
  def apartment_params
    params.require(:apartment).permit(:street, :city, :user_id)
  end

  def set_apartment
    @apartment = Apartment.find(params[:id])
  end
end
