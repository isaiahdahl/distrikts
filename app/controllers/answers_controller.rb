class AnswersController < ApplicationController

  def quiz
    add_to_cookie(params[:score_id])
    
    @question = Question.find(params[:question_id].next)

    respond_to do |format|
      format.js
      format.html { redirect_back fallback_location: root_path }
    end
  end

  def results
    add_to_cookie(params[:score_id])
    @distrikts = Distrikt.all
    # get_results(cookies[:score])
  end

  private

  def add_to_cookie(score)
    cookies[:score] = "" if cookies[:score].nil?
    cookies[:score] += "#{score},"
  end

  # def get_results(cookie)
  #   @scores = []
  #   cookie.split(",").each do |id|
  #     @scores << Score.find(id.to_i)
  #   end

  #   artsy = 0
  #   outdoor = 0
  #   authentic = 0
  #   trendy = 0
  #   foodie = 0
  #   walkability = 0
  #   touristy = 0
  #   shopping = 0
  #   nightlife = 0
  #   outdoor = 0
  #   luxury = 0
  #   weather = 0
  #   zen = 0

  #   @scores.each do |score|

  #   artsy += score.artsy
  #   outdoor += score.outdoor
  #   authentic += score.authentic
  #   trendy += score.trendy
  #   foodie += score.foodie
  #   walkability += score.walkability
  #   touristy += score.touristy
  #   shopping += score.shopping
  #   nightlife += score.nightlife
  #   outdoor += score.outdoor
  #   luxury += score.luxury
  #   weather += score.weather
  #   zen += score.zen
  #   end

  #   @score = Score.new(
  #     artsy: artsy,
  #     outdoor: score.outdoor,
  #     authentic: score.authentic,
  #     trendy: score.trendy,
  #     foodie: score.foodie,
  #     walkability: score.walkability,
  #     touristy: score.touristy,
  #     shopping: score.shopping,
  #     nightlife: score.nightlife,
  #     outdoor: score.outdoor,
  #     luxury: score.luxury,
  #     weather: score.weather,
  #     zen: score.zen
  #     )

  #   @user = User.new(score_id: @score)
  # end
end
