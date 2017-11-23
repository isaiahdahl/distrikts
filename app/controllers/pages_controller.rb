class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @questions = Question.all.order(:order)
    @question = Question.first
    cookies[:score] = nil
  end
end
