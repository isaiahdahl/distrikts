class PlacesController < ApplicationController
  def new
    
    @filter = params["search"]["filter"]
    @distrikt = Distrikt.find(params[:distrikt_id])
    result = FourSquare.new(@distrikt, @filter)
    @places = result.establishments

    @place = Place.new(
      name: @places.first["name"],
      address: @places.first["location"]["formattedAddress"].join(" ")
      )
    authorize @place
  end

  def create
    @place = Place.new
  end

  private

  def restaurant_params
    params.require(:place).permit(:name, :address, :category, :phone, :img_url, :filter)
  end

  def search_params
  end
end
