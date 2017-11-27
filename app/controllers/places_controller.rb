class PlacesController < ApplicationController
  def new
    
    @filter = params["search"]["filter"]
    @distrikt = Distrikt.find(params[:distrikt_id])
    
    # Foursquare results
    foursquare = Foursquare.new(@distrikt, @filter)
    @fs_places = foursquare.establishments

    # Yelp results
    yelp = Yelp.new(@filter, @distrikt.address)
    @yelp_places = yelp.yelp_search

    @place = Place.new(
      name: @fs_places.first["name"],
      address: @fs_places.first["location"]["formattedAddress"].join(" "),
      phone: @fs_places.first["contact"]["phone"],
      img_url: @yelp_places["businesses"].first["image_url"]
      )
    authorize @place
    
    respond_to do |format|
      format.js
      format.html { redirect_back fallback_location: root_path }
    end
  end

  def create
    @place = Place.new(place_params)
    @place.distrikt_id = params[:distrikt_id]
    authorize @place
    raise
    if @place.save
      redirect_to distrikt_path(params[:distrikt_id])
    else
      # GO BACK TO THE FORM
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :category, :phone, :img_url, :filter, :distrikt_id)
  end
end
