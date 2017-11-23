class PagesController < ApplicationController
  def home
    @questions = Question.all.order(:order)
    @question = Question.first
    cookies[:score] = nil
  end
end
