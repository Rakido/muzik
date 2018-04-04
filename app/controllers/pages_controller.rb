class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @instruments = Instrument::CATEGORIES
  end

  def styleguide
  end


end
