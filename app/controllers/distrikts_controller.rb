class DistriktsController < ApplicationController
  before_action :distrikt, only: [:edit, :show, :update, :destroy, :visit, :wishlist]
  before_action :authorize_distrikt, only: [:edit, :show, :update, :destroy, :visit, :wishlist]
  before_action :load_ransack_search, :only => :index


  def index
    @user = current_user
    q_param = params[:q]
    @distrikts = policy_scope(Distrikt)
    if !params[:scope].blank?
      @distrikts = @user.favorited_by_type 'Distrikt', scope: [params[:scope]]
      @scope = params[:scope]
    end
    @q = @distrikts.ransack q_param
    @distrikts = @q.result
    @score = @user.score
    @cities = cities
    @countries = countries
    @continents = continents
    assign_style(@user)
    wishlisted
    visited
    @scores = top_four
    respond_to do |format|
      if request.xhr?
        format.js
      else
        format.html
      end
    end
    # @user.favorited_by_type 'Distrikt', scope: [:wishlist]
  end

  def explore
    q_param = params[:q]

    @q = Distrikt.ransack q_param
    @distrikts = @q.result
    authorize @distrikts
    @distrikts_droped = @distrikts.drop(1)
    @user = current_user
    @cities = cities
    @countries = countries
    @continents = continents
    assign_style(@user)
    respond_to do |format|
      if request.xhr?
        format.js
      else
        format.html
      end
    end
  end

  def show
    authorize @distrikt
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
    @distrikts = Distrikt.all
    @user = current_user
    @score = @user.score
    @place = Place.new
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

  def visit
    user = current_user
    user.favorite @distrikt, scope: [:visit]
    unless user.favorites.where(favoritable_id: @distrikt.id).where(scope: ["wishlist"]).empty?
      user.favorites.where(favoritable_id: @distrikt.id).where(scope: ["wishlist"]).first.destroy
    end
    redirect_to distrikt_path(@distrikt)
  end

  def wishlist
    user = current_user
    user.favorite @distrikt, scope: [:wishlist]
    redirect_to distrikt_path(@distrikt)
  end

  def remove_visit
    @distrikt = Distrikt.find(params[:id])
    authorize @distrikt
    user = current_user
    user.favorites.where(favoritable_id: @distrikt.id).where(scope: ["visit"]).first.destroy
    redirect_to distrikt_path(@distrikt)
  end

  def remove_wishlist
    @distrikt = Distrikt.find(params[:id])
    authorize @distrikt
    user = current_user
    user.favorites.where(favoritable_id: @distrikt.id).where(scope: ["wishlist"]).first.destroy
    redirect_to distrikt_path(@distrikt)
  end

  private

  def top_four
    scores = @score.attributes
    scores.delete("id")
    scores.delete("created_at")
    scores.delete("updated_at")
    sorted_scores = scores.sort_by{|k,v| v}.reverse
    sorted_scores[0...4]
  end

  def distrikt_params
    params.require(:distrikt).permit(:name, :description, photos: [])
  end

  def distrikt
    @distrikt = Distrikt.find(params[:id])
  end

  def cities
    @cities = []
    City.all.each { |city| @cities << city.name }
    @cities.sort!
    @cities.unshift(['City', ''])

  end

  def countries
    @countries = []
    City.all.each { |city| @countries << city.country }
    @countries.sort!
    @countries.unshift(['Country', ''])
  end

  def continents
    @continents = []
    City.all.each { |city| @continents << city.continent }
    @continents.sort!
    @continents.unshift(['Continent', ''])
  end

  def place_coordinates
    @places_coordinates = @places.map do |place|
      lng = place.longitude unless place.longitude.nil?
      lat =  place.latitude unless place.latitude.nil?
      price = "€" * place.price
      feature = { "type": "Feature",
                  "id": "#{place.id}",
                  "properties": {
                    "description":
                    "<div class=\"popup-bottom\">
                    <h4 class=\"bold\">#{place.name}</h4>
                    <h5 class=\"light\">#{place.category.capitalize} | #{price}</h5>
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

  def coordinates
    @coordinates = @places.map do |place|
      unless place.longitude.nil? || place.latitude.nil?
        [place.longitude, place.latitude]
      end
    end
  end
  def assign_style(user)
    @score = user.score
    @score_id = @score.id
    @styles = Style.all.sort {|a,b| Compare.new(b.score, @score).average<=>Compare.new(a.score, @score).average }
    current_user.style_id = @styles.first.id
  end

  def authorize_distrikt
    authorize @distrikt
  end

  def wishlisted
    @wishlisted = @user.favorites.where(scope: "wishlist")
  end

  def visited
    @visited = @user.favorites.where(scope: "visit")
  end
end
