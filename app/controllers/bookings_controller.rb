class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    space = Space.find(params[:space_id])

    @booking.space = space
    start_date = Date.new(booking_params["start_date(1i)"]&.to_i, booking_params["start_date(2i)"]&.to_i, booking_params["start_date(3i)"]&.to_i)
    end_date = Date.new(booking_params["end_date(1i)"]&.to_i, booking_params["end_date(2i)"]&.to_i, booking_params["end_date(3i)"]&.to_i)
    # user_id = booking_params[:user_id].to_i
    @booking.user = current_user

    @booking.start_date = start_date
    @booking.end_date = end_date
    @booking.status = 0
    # @booking.user_id = user_id
    authorize @booking
    if @booking.save
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end


  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :update
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:end_date, :start_date, :user_id)
  end
end
