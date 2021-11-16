class SpacesController < ApplicationController
  def new
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
    @spaces = Space.all
  end

  def show
    @space = Space.find(params[:id])
    @booking = Booking.new
  end

  private

  def space_params
    params.require(:space).permit(:name, :description, :price, :category, :size, :address)
  end
end
