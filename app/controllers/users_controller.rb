class UsersController < ApplicationController
  def dashboard
    authorize current_user
    @bookings = Booking.all.where(user_id: current_user)
    @bookings_as_owner = current_user.bookings_as_owner
    @spaces = Space.all.where(user_id: current_user)
  end

  def spaces
    authorize current_user
    @bookings = Booking.all.where(user_id: current_user)
    @bookings_as_owner = current_user.bookings_as_owner
    @spaces = Space.all.where(user_id: current_user)
  end

  def pending
    authorize current_user
    @bookings = Booking.all.where(user_id: current_user).where(status: :pending)
    @bookings_as_owner = current_user.bookings_as_owner
    @spaces = Space.all.where(user_id: current_user)
  end

  def accepted
    authorize current_user
    @bookings = Booking.all.where(user_id: current_user).where(status: :accepted)
    @bookings_as_owner = current_user.bookings_as_owner
    @spaces = Space.all.where(user_id: current_user)
  end
end
