class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @instruments = Instrument.all
    @last_instruments = Instrument.last(4)
  end

  def styleguide
  end


end
