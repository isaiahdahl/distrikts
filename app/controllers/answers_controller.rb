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
  end

  private

  def add_to_cookie(score)
    cookies[:score] = "" if cookies[:score].nil?
    cookies[:score] += "#{score},"
  end
end
