class ProfilesController < ApplicationController


  def show
    @instruments = current_user.instruments

  end

end
