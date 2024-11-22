class UsersController < ApplicationController
  def profile
    
  end

  def listings
    @instruments = Instrument.where(user: current_user)
  end

  def bookings
    @bookings = Booking.where(user: current_user)
  end
end
