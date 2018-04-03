class InstrumentsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home, :show]


  def show
    @instrument = Instrument.find(params[:id])
  end


end
