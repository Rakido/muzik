class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :show]

  def index
    @instruments = Instrument.all
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    @instrument.save

    redirect_to profile_path
  end

  private

  def instrument_params
    params.require(:instrument).permit(
      :name,
      :category,
      :city,
      :price,
      :description,
      :photo
    )   
  end
end
