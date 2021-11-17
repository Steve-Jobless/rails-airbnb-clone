class UsersController < ApplicationController
  def dashboard
    @bookings = Booking.all.where(user_id: current_user)
  end
end
