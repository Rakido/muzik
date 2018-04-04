class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @instruments = Instrument.all
    @instruments = Instrument.where.not(latitude: nil, longitude: nil)

        @markers = @instruments.map do |instrument|
          {
            lat: instrument.latitude,
            lng: instrument.longitude#,
            # infoWindow: { content: render_to_string(partial: "/instruments/map_box", locals: { instrument: instrument }) }
          }
        end
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
