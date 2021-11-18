class SpacesController < ApplicationController
  def new
    # authorize @space
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    if @space.save
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  def index
    if params[:search].present?
      @spaces = Space.where("address ILIKE ?", "%#{params[:search][:query]}%")
      # the `geocoded` scope filters only flats with coordinates (latitude & longitude)

    elsif params[:address].present?
      @spaces = Space.where("address ILIKE ?", "%#{params[:address]}%")
    else
      @spaces = Space.all
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
    params.require(:space).permit(:name, :description, :price, :category, :size, :address, :photo)
  end
end
