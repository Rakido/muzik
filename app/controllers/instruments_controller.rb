class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
  end
end
