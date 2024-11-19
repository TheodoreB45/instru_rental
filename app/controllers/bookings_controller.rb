class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def create
    @instrument = Instrument.find(params[:instrument_id])
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to instrument_path(@instrument)
    else
      render "instruemnts/show", status: :unprocessable_entity
    end
  end

  # def destroy
  #   @booking = Booking.find(params[:id])
  #   @instrument = @booking.instrument
  #   @booking.destroy
  #   redirect_to instrument_path(@instrument), status: :see_other
  # end

  private

  def booking_params
    params.require(:booking).permit(:price, :instrument_id, :rating, :booking_period)
  end
end
