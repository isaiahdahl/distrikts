class PagesController < ApplicationController
  def home
    @question = Question.first
    cookies[:score] = nil
  end
end
