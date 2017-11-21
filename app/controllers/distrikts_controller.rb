class DistriktsController < ApplicationController
  before_action :task, only: [:edit, :show, :update, :destroy]
  before_action :load_ransack_search, :only => :index
  autocomplete :distrikts, :name

  def index
    @q = Distrikt.ransack(params[:q])
    @distrikts = @q.result
    @user = User.first
    @cities = cities
    @countries = countries
    @continents = continents
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

  def cities
    @cities = [""]
    City.all.each { |city| @cities << city.name }
    @cities
  end

  def countries
    @countries = [""]
    City.all.each { |city| @countries << city.country }
    @countries
  end

  def continents
    @continents = [""]
    City.all.each { |city| @continents << city.continent }
    @continents
  end
end