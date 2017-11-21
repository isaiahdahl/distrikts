class DistriktsController < ApplicationController
  before_action :task, only: [:edit, :show, :update, :destroy]
  def index
    @distrikts = Distrikt.all
  end

  def show
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
<<<<<<< Updated upstream
=======

  def cities
    @cities = ["City"]
    City.all.each { |city| @cities << city.name }
    @cities.sort!
  end

  def countries
    @countries = ["Country"]
    City.all.each { |city| @countries << city.country }
    @countries.sort!
  end

  def continents
    @continents = ["Continent"]
    City.all.each { |city| @continents << city.continent }
    @continents.sort!
  end
>>>>>>> Stashed changes
end