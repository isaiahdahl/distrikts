class PlacesController < ApplicationController
  def new
    @place = Place.first
  end

  def create
    @place = Place.new
  end
end
