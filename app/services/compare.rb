class Compare
  def initialize(distrikt, user)
    @distrikt = distrikt
    @user = user
  end

  def average
    match_avg = []
    match_avg << artsy
    match_avg << outdoor
    match_avg << authentic
    match_avg << trendy
    match_avg << foodie
    match_avg << walkability
    match_avg << touristy
    match_avg << shopping
    match_avg << nightlife
    match_avg << outdoor
    match_avg << luxury
    match_avg << weather
    match_avg << zen
    average = match_avg.reduce(:+) / match_avg.size.to_f
    average.round
  end

  def artsy
    u = @user.artsy
    d = @distrikt.artsy
    percent_match(u,d)
  end

  def authentic
    u = @user.authentic
    d = @distrikt.authentic
    percent_match(u,d)
  end

  def trendy
    u = @user.trendy
    d = @distrikt.trendy
    percent_match(u,d)
  end

  def foodie
    u = @user.foodie
    d = @distrikt.foodie
    percent_match(u,d)
  end

  def walkability
    u = @user.walkability
    d = @distrikt.walkability
    percent_match(u,d)
  end

  def touristy
    u = @user.touristy
    d = @distrikt.touristy
    percent_match(u,d)
  end

  def shopping
    u = @user.shopping
    d = @distrikt.shopping
    percent_match(u,d)
  end

  def nightlife
    u = @user.nightlife
    d = @distrikt.nightlife
    percent_match(u,d)
  end

  def outdoor
    u = @user.outdoor
    d = @distrikt.outdoor
    percent_match(u,d)
  end

  def luxury
    u = @user.luxury
    d = @distrikt.luxury
    percent_match(u,d)
  end

  def weather
    u = @user.weather
    d = @distrikt.weather
    percent_match(u,d)
  end

  def zen
    u = @user.zen
    d = @distrikt.zen
    percent_match(u,d)
  end

  def percent_match(u, d)
    if d > u
      (1 - (d.to_f - u.to_f) / d.to_f) * 100
    else
      (1 - (u.to_f - d.to_f) / u.to_f) * 100
    end
  end
end
