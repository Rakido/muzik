class InstrumentsController < ApplicationController

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
     :photo,
     )
   # rajout d'un end suite à un message d'erreur
 end

  skip_before_action :authenticate_user!, only: [:index]


  def index
    @instruments = Instrument.all
  end
end
