class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def create
    @instrument = Instrument.find(params[:instrument_id])
    @booking = Booking.new(booking_params)
    @booking.instrument = @instrument
    @booking.user = current_user
    if @booking.save
      # after a booking is create it should show up on the user profile
      redirect_to profile_path(@profile)
    else
      render "instruments/show", status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @instrument = @booking.instrument
    @booking.destroy
    redirect_to instrument_path(@instrument), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:instrument_id, :booking_period, :start_date, :end_date)
  end
end
