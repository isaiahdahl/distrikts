class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @questions = Question.all.order(:order)
    @question = Question.first
    cookies[:score] = nil
    @array = ["an Urban Explorer", "a Cultural Scavenger", "a Cultural Ninja", "a Luxury Scavenger", "a Hedonist Connoisseur", "a Zen Ninja"]
  end
end
