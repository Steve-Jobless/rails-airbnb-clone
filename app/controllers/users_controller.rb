class UsersController < ApplicationController
  def dashboard
    authorize current_user
    @bookings = Booking.all.where(user_id: current_user)
  end
end
