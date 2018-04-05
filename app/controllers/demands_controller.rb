class DemandsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def accept
    @reservation = Reservation.find(params[:id])
    @reservation.status = "accepted"
    @reservation.save

    redirect_to profile_path
  end

  def refuse
    @reservation = Reservation.find(params[:id])
    @reservation.status = "refused"
    @reservation.save

    redirect_to profile_path
  end
end
