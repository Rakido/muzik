class ProfilesController < ApplicationController
  def show
    @instruments = current_user.instruments
    @pending_demands = current_user.demands.where(status: "pending")
    # binding.pry
    @accepted_demands = current_user.demands.where(status: "accepted")
    @reservations = current_user.reservations
  end
end
