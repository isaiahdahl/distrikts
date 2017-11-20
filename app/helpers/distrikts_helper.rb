module DistriktsHelper
  def compare(distrikt, user)
    @match_avg = []
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

  def artsy(distrikt, user)
    u = user.artsy
    d = distrikt.artsy
    percent_match(u,d)
  end

  def authentic(distrikt, user)
    u = user.authentic
    d = distrikt.authentic
    percent_match(u,d)
  end

  def trendy(distrikt, user)
    u = user.trendy
    d = distrikt.trendy
    percent_match(u,d)
  end

  def foodie(distrikt, user)
    u = user.foodie
    d = distrikt.foodie
    percent_match(u,d)
  end

  def walkability(distrikt, user)
    u = user.walkability
    d = distrikt.walkability
    percent_match(u,d)
  end

  def touristy(distrikt, user)
    u = user.touristy
    d = distrikt.touristy
    percent_match(u,d)
  end

  def shopping(distrikt, user)
    u = user.shopping
    d = distrikt.shopping
    percent_match(u,d)
  end

  def nightlife(distrikt, user)
    u = user.nightlife
    d = distrikt.nightlife
    percent_match(u,d)
  end

  def outdoor(distrikt, user)
    u = user.outdoor
    d = distrikt.outdoor
    percent_match(u,d)
  end

  def luxury(distrikt, user)
    u = user.luxury
    d = distrikt.luxury
    percent_match(u,d)
  end

  def weather(distrikt, user)
    u = user.weather
    d = distrikt.weather
    percent_match(u,d)
  end

  def zen(distrikt, user)
    u = user.zen
    d = distrikt.zen
    percent_match(u,d)
  end

  def percent_match(user, distrikt)
    if distrikt > user
      (1 - (distrikt.to_f - user.to_f)/distrikt.to_f) * 100
    else
      (1 - (user.to_f - distrikt.to_f)/user.to_f) * 100
    end
  end
end
