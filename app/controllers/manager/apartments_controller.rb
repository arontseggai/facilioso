class Manager::ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show]

  def index
    @apartments = Apartment.all

  end

  def show
    set_apartment
  end

  private
  def set_apartment
    @apartment = Apartment.find(params[:id])
  end
end
