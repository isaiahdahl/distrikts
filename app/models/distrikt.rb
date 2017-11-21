class Distrikt < ApplicationRecord
  belongs_to :city
  has_many :users, through: :matches
  belongs_to :score, dependent: :destroy
  has_many :places

  def self.compare(distrikt, user)
    @match_avg = []
    @match_avg << artsy(distrikt, user)
    @match_avg << outdoor(distrikt, user)
    @match_avg << authentic(distrikt, user)
    @match_avg << trendy(distrikt, user)
    @match_avg << foodie(distrikt, user)
    @match_avg << walkability(distrikt, user)
    @match_avg << touristy(distrikt, user)
    @match_avg << shopping(distrikt, user)
    @match_avg << nightlife(distrikt, user)
    @match_avg << outdoor(distrikt, user)
    @match_avg << luxury(distrikt, user)
    @match_avg << weather(distrikt, user)
    @match_avg << zen(distrikt, user)
    average = @match_avg.reduce(:+) / @match_avg.size.to_f
    average.round
  end

  def self.artsy(distrikt, user)
    u = user.artsy
    d = distrikt.artsy
    percent_match(u,d)
  end

  def self.authentic(distrikt, user)
    u = user.authentic
    d = distrikt.authentic
    percent_match(u,d)
  end

  def self.trendy(distrikt, user)
    u = user.trendy
    d = distrikt.trendy
    percent_match(u,d)
  end

  def self.foodie(distrikt, user)
    u = user.foodie
    d = distrikt.foodie
    percent_match(u,d)
  end

  def self.walkability(distrikt, user)
    u = user.walkability
    d = distrikt.walkability
    percent_match(u,d)
  end

  def self.touristy(distrikt, user)
    u = user.touristy
    d = distrikt.touristy
    percent_match(u,d)
  end

  def self.shopping(distrikt, user)
    u = user.shopping
    d = distrikt.shopping
    percent_match(u,d)
  end

  def self.nightlife(distrikt, user)
    u = user.nightlife
    d = distrikt.nightlife
    percent_match(u,d)
  end

  def self.outdoor(distrikt, user)
    u = user.outdoor
    d = distrikt.outdoor
    percent_match(u,d)
  end

  def self.luxury(distrikt, user)
    u = user.luxury
    d = distrikt.luxury
    percent_match(u,d)
  end

  def self.weather(distrikt, user)
    u = user.weather
    d = distrikt.weather
    percent_match(u,d)
  end

  def self.zen(distrikt, user)
    u = user.zen
    d = distrikt.zen
    percent_match(u,d)
  end

  def self.percent_match(user, distrikt)
    if distrikt > user
      (1 - (distrikt.to_f - user.to_f)/distrikt.to_f) * 100
    else
      (1 - (user.to_f - distrikt.to_f)/user.to_f) * 100
    end
  end
end
