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
    @places = @distrikt.places.map do |place|
      { "type": "Feature", 
        "geometry": {
            "type": "Point",
            "coordinates": [place.latitude, place.longitude]
             }
      }
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
    params.require(:distrikt).permit(:name, :description)
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
end