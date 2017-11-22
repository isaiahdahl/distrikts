require 'byebug'
class DistriktsController < ApplicationController
  before_action :distrikt, only: [:edit, :show, :update, :destroy]
  before_action :load_ransack_search, :only => :index


  def index
    q_param = params[:q]
    page = params[:page]
    per_page = params[:per_page]

    @q = Distrikt.ransack q_param
    @distrikts = @q.result.page(page).per(per_page)
    @user = User.first
    @cities = cities
    @countries = countries
    @continents = continents
  end

  def show
    if params[:category]
      @places = @distrikt.places.send(params[:category])
    else
      @places = @distrikt.places
    end
    place_coordinates
    coordinates
    respond_to do |format|
      if request.xhr?
        format.js
      else
        format.html
      end
    end
  end

  def new
    @distrikt = Distrikt.new(distrikt_params)
  end

  def create
    @distrikt = Distrikt.new(distrikt_params)
    @distrikt.save
    redirect_to distrikts_path
  end

  def edit
  end

  def update
    @distrikt.update(distrikt_params)
    redirect_to distrikts_path
  end

  def destroy
    @distrikt.destroy
    redirect_to distrikts_path
  end

  private
  def distrikt_params
    params.require(:distrikt).permit(:name, :description, photos: [])
  end

  def distrikt
    @distrikt = Distrikt.find(params[:id])
  end

  def cities
    @cities = [""]
    City.all.each { |city| @cities << city.name }
    @cities.sort!
  end

  def countries
    @countries = [""]
    City.all.each { |city| @countries << city.country }
    @countries.sort!
  end

  def continents
    @continents = [""]
    City.all.each { |city| @continents << city.continent }
    @continents.sort!
  end

  def place_coordinates
    @places_coordinates = @places.map do |place|
      lng = place.longitude unless place.longitude.nil?
      lat =  place.latitude unless place.latitude.nil?
      feature = { "type": "Feature",
                  "geometry": {
                      "type": "Point",
                      "coordinates": [lng, lat]
                  }
      }
      feature
    end
  end

  def coordinates
    @coordinates = @places.map do |place|
      unless place.longitude.nil? || place.latitude.nil?
        [place.longitude, place.latitude]
      end
    end
  end
end