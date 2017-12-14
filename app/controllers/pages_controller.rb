class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @questions = Question.all.order(:order)
    @question = Question.first
    cookies[:score] = nil
    @array = ["an Urban Explorer", "a Cultural Fashionista", "a Chic Foodie", "a Libertine Connoisseur", "a Hedonist Hipster", "a Posh Ninja"]
  end

  def temp_home
    @questions = Question.all.order(:order)
    @question = Question.first
    @array = ["an Urban Explorer", "a Cultural Fashionista", "a Chic Foodie", "a Libertine Connoisseur", "a Hedonist Hipster", "a Posh Ninja"]
  end

  def subscribe
    @list_id = ENV['MAILCHIMP_LIST_ID']
    gb = Gibbon::Request.new

    gb.lists(@list_id).members.create(
      body: {
        email_address: params[:email][:email],
        status: "subscribed"
      })

    respond_to do |format|
      format.js { render :clear }
      format.html { redirect_back fallback_location: root }
    end
  end
end
