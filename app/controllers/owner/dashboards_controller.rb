class Owner::DashboardsController < ApplicationController
  def show
    @apartments = current_user.apartments
  end
end
