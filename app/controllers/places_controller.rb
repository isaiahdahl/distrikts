class PlacesController < ApplicationController
  def new
    
    @filter = params["search"]["filter"]
    @distrikt = Distrikt.find(params[:distrikt_id])
    
    # Foursquare results
    foursquare = Foursquare.new(distrikt: @distrikt, filter: @filter)
    @fs_places = foursquare.establishments
    @fs_photos = foursquare.photo_search_url(@fs_places.first["id"])

    @place = Place.new(
      name: @fs_places.first["name"],
      address: @fs_places.first["location"]["formattedAddress"].join(" "),
      phone: @fs_places.first["contact"]["phone"],
      url: @fs_places.first["url"],
      hour: @fs_places.first["hours"]["status"],
      price: @fs_places.first["price"]["tier"],
      latitude: @fs_places.first["location"]["lat"],
      longitude: @fs_places.first["location"]["lng"],
      img_url: @fs_photos["prefix"] + "original" + @fs_photos["suffix"]
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
    if @place.save
      redirect_to distrikt_path(params[:distrikt_id])
    else
      # GO BACK TO THE FORM
      render :new
    end
  end

  def show
    @place = Place.find(params[:id])
    @distrikt = Distrikt.find(params[:distrikt_id])

    authorize @place
    respond_to do |format|
      format.js
      format.html { redirect_back fallback_location: root_path }
    end
  end

  def close
    @distrikt = Distrikt.find(params[:distrikt_id])
    @place = Place.new
    place_coordinates

    authorize @place
    respond_to do |format|
      format.js
      format.html { redirect_back fallback_location: root_path }
    end
  end

  def place_coordinates
    @places_coordinates = @distrikt.places.map do |place|
      lng = place.longitude unless place.longitude.nil?
      lat =  place.latitude unless place.latitude.nil?
      feature = { "type": "Feature",
                  "id": "#{place.id}",
                  "properties": {
                      "description":
                          "<div class=\"popup-bottom\">
                    <h4 class=\"bold\">#{place.name}</h4>
                    <h5 class=\"light\">#{place.category.capitalize} | #{place.description}</h5>
                    </div>"
                  },
                  "geometry": {
                      "type": "Point",
                      "coordinates": [lng, lat]
                  }
      }
      feature
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :category, :phone, :img_url, :filter, :distrikt_id, :url, :hour, :price, :latitude, :longitude)
  end
end
