class PagesController < ApplicationController
  def home
    @questions = Question.all
  end
end
