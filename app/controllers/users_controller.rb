class UsersController < ApplicationController
  def dashboard
    @bookings = Booking.all
  end
end
