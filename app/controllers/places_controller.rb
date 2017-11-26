class PlacesController < ApplicationController
  def new
    
    @filter = params["search"]["filter"]
    @distrikt = Distrikt.find(params[:distrikt_id])
    result = FourSquare.new(@distrikt, @filter)
    @places = result.establishments
    @place = Place.new(
      name: @places.first["name"],
      address: @places.first["location"]["formattedAddress"].join(" "),
      phone: @places.first["contact"]["phone"]
      )
    authorize @place

    respond_to do |format|
      format.js
      format.html { redirect_back fallback_location: root_path }
    end
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to distrikt_path(@distrikt.id)
    else
      # GO BACK TO THE FORM
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :category, :phone, :img_url, :filter)
  end
end
