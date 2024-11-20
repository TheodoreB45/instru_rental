class UsersController < ApplicationController
  def profile
    @instruments = Instrument.where(user: current_user)
    @bookings = Booking.where(user: current_user)
  end
end
