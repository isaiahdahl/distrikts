class DistriktsController < ApplicationController
  before_action :distrikt, only: [:edit, :show, :update, :destroy, :visit, :wishlist]
  before_action :authorize_distrikt, only: [:edit, :show, :update, :destroy, :visit, :wishlist]
  before_action :load_ransack_search, :only => :index


  def index
    @user = current_user
    @distrikts = policy_scope(Distrikt)
    # Check for visit/wishlist params, this allows us to ransack sort the wishlist
    # and visited filters.
    if !params[:scope].blank?
      @distrikts = @user.favorited_by_type 'Distrikt', scope: [params[:scope]]
      @scope = params[:scope]
    end
    @q = @distrikts.ransack params[:q]
    @distrikts = @q.result
    @score = @user.score
    @scores = top_four
    # Assign style every time user goes to index so that if his style changes
    assign_style(@user)
    cities
    countries
    continents
    wishlisted
    visited
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
    @q = Distrikt.ransack params[:q]
    @unsorted_distrikts = @q.result
    authorize @unsorted_distrikts
    # Distrikts are sorted by id, one is required to be dropped for the explore page functionality
    @distrikts = @unsorted_distrikts.sort_by { |distrikt| distrikt.id }
    @distrikts_droped = @distrikts.drop(1)
    @user = current_user
    assign_style(@user)
    cities
    countries
    continents
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
    @distrikt = Distrikt.new()
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
    # Assign favorite to the distrikt with the scope of visit.
    user.favorite @distrikt, scope: [:visit]
    # If the distrikt was in the wishlist, remove it.
    unless user.favorites.where(favoritable_id: @distrikt.id).where(scope: ["wishlist"]).empty?
      # possibly can just run remove_wishlist code
      user.favorites.where(favoritable_id: @distrikt.id).where(scope: ["wishlist"]).first.destroy
    end
    redirect_to distrikt_path(@distrikt)
  end

  def wishlist
    user = current_user
    # Assign favorite to the distrikt with the scope of wishlist.
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
    @cities.uniq!
    @cities.sort!
    @cities.unshift(['City', ''])

  end

  def countries
    @countries = []
    City.all.each { |city| @countries << city.country }
    @countries.uniq!
    @countries.sort!
    @countries.unshift(['Country', ''])
  end

  def continents
    @continents = []
    City.all.each { |city| @continents << city.continent }
    @continents.uniq!
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
