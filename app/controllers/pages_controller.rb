class PagesController < ApplicationController
  def home
    @questions = Question.all
    @question = Question.first
    cookies[:score] = nil
  end
end
