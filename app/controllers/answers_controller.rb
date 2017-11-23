class AnswersController < ApplicationController

  def quiz
    if Question.find(params[:question_id]).order == 1
      cookies[:score] = nil
      add_to_cookie(params[:score_id])
    else
      add_to_cookie(params[:score_id])
    end

    @question = Question.find(params[:question_id].next)

    respond_to do |format|
      format.js
      format.html { redirect_back fallback_location: root_path }
    end
  end

  def results
    add_to_cookie(params[:score_id])
    @distrikts = Distrikt.all
    @questions = Question.all
    @question = Question.first

    result = Result.new(cookies[:score])
    @score = result.get_score
    @score_id = @score.id

    @scores = top_four

    @styles = Style.all.sort {|a,b| Compare.new(b.score, @score).average<=>Compare.new(a.score, @score).average }
  end

  private

  def add_to_cookie(score)
    cookies[:score] = "" if cookies[:score].nil?
    cookies[:score] += "#{score},"
  end

  def top_four
    scores = @score.attributes
    scores.delete("id")
    scores.delete("created_at")
    scores.delete("updated_at")
    sorted_scores = scores.sort_by{|k,v| v}.reverse
    sorted_scores[0...4]
  end
end
