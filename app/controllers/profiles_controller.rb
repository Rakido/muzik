class ProfilesController < ApplicationController


  def show
    @instruments = current_user.instruments
  end


  def edit
    @profile = current_user
  end

  def update
    @profile = current_user

    if @profile.update(profile_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name,
      :phone_number,
      :avatar,
    )
  end

end
