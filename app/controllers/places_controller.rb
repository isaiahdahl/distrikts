class PlacesController < ApplicationController

  def search
    @filter = params[:filter]
    @distrikt = Distrikt.find(params[:distrikt_id])

    # Foursquare results
    foursquare = Foursquare.new(distrikt: @distrikt, filter: @filter)
    @fs_places = foursquare.suggest

    authorize @distrikt
    respond_to do |format|
      format.js
      format.html { redirect_back fallback_location: root_path }
    end
  end

  def new
  end

  def create
    foursquare = Foursquare.new
    venue = foursquare.get_venue(params["place_id"])
    @place = Place.new(
      name: venue["name"],
      address: venue["location"]["address"],
      category: venue["categories"].first["name"],
      phone: venue["contact"]["phone"],
      url: venue["url"],
      latitude: venue["location"]["lat"],
      longitude: venue["location"]["lng"]
      )
    @place.hour = venue["hours"]["status"] unless venue["hours"].nil?
    @place.price = venue["price"]["tier"] unless venue["price"].nil?
    @place.img_url = venue["bestPhoto"]["prefix"] + "original" + venue["bestPhoto"]["suffix"] unless venue["bestPhoto"].nil?
    @place.distrikt_id = params[:distrikt_id]
    @distrikt = Distrikt.find(@place.distrikt_id)
    authorize @place
    if @place.save
      respond_to do |format|
        format.js { render :show }
        format.html { redirect_back fallback_location: root_path }
      end
    else
      respond_to do |format|
        format.js { render :search }
        format.html { redirect_back fallback_location: root_path }
      end
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
