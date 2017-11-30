class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @questions = Question.all.order(:order)
    @question = Question.first
    cookies[:score] = nil
    @array = ["an Urban Explorer", "a Cultural Fashionista", "a Chic Foodie", "a Libertine Connoisseur", "a Hedonist Hipster", "a Posh Ninja"]
  end
end
