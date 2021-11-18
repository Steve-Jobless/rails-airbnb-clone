class SpacesController < ApplicationController
  def new
    @space = Space.new
    authorize @space
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user
    authorize @space
    if @space.save
      redirect_to space_path(@space)
    else
      raise
      render :new
    end
  end

  def index
    if params[:search].present?
      @spaces = policy_scope(Space).where("address ILIKE ?", "%#{params[:search][:query]}%")
      # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    elsif params[:address]
      @spaces = policy_scope(Space).where("address ILIKE ?", "%#{params[:address]}%")
    else
      @spaces = policy_scope(Space).all
    end
    @markers = @spaces.geocoded.map do |space|
      {
        lat: space.latitude,
        lng: space.longitude,
        info_window: render_to_string(partial: "info_window", locals: { space: space })
      }
    end
  end

  def show
    @space = Space.find(params[:id])
    authorize @space
    @booking = Booking.new
    @spaces = Space.near([@space.latitude, @space.longitude], 1)
    @markers = @space && @spaces.map do |space|
      {
        lat: space.latitude,
        lng: space.longitude,
        info_window: render_to_string(partial: "info_window", locals: { space: space })
      }
    end
  end

  private

  def space_params
    params.require(:space).permit(:name, :description, :price, :category, :size, :address, :photos, :amenities, :safety_note, :neighborhood)
  end
end
