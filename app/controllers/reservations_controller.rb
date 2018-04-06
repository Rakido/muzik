class ReservationsController < ApplicationController


  def new
    @instrument  = Instrument.find(params[:instrument_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params_with_parsed_dates)

    @instrument             = Instrument.find(params[:instrument_id])
    @reservation.instrument = @instrument

    number_of_days = (@reservation.end_date - @reservation.start_date).to_i

    total_price = number_of_days * @instrument.price

    @reservation.total_price = total_price

    @reservation.user = current_user


    if @reservation.save
      redirect_to profile_path
    else
      render :new
    end

  end

  private

  def reservation_params_with_parsed_dates
    params                             = reservation_params
    start_date_string = params.delete(:start_date)
    end_date_string   = params.delete(:end_date)
    
    start_date = Date.strptime(start_date_string, "%m/%d/%Y")
    end_date   = Date.strptime(end_date_string, "%m/%d/%Y")


    params[:start_date] = start_date
    params[:end_date]   = end_date

    return params
  end

  def reservation_params
    params.require(:reservation).permit(:message, :start_date, :end_date)
  end

end


