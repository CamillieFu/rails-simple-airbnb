class FlatsController < ApplicationController
before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @search = params[:search]
    if @search == nil
      @flats = Flat.all
    else
      @flats = Flat.where('address LIKE ?', "%#{@search}%")
    end
  end

  def show
    @booking = [params[:start], params[:end]]
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit; end

  def update
    @flat.update(flat_params)

    redirect_to flat_path(@flat)
  end

  def search
    @search = params[:search]
    raise
    @flats = Flat.where('address LIKE ?', "%#{@search}%")
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private
  def flat_params
    params.require(:flat).permit(:name, :address, :number_of_guests, :description, :price_per_night)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
