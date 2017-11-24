class Result
  def initialize(cookie)
    @cookie = cookie
  end

  def get_score
    @scores = []
    @cookie.split(",").each do |id|
      @scores << Score.find(id.to_i)
    end

    artsy = 0
    outdoor = 0
    authentic = 0
    trendy = 0
    foodie = 0
    walkability = 0
    touristy = 0
    shopping = 0
    nightlife = 0
    outdoor = 0
    luxury = 0
    weather = 0
    zen = 0

    @scores.each do |score|

    artsy += score.artsy
    outdoor += score.outdoor
    authentic += score.authentic
    trendy += score.trendy
    foodie += score.foodie
    walkability += score.walkability
    touristy += score.touristy
    shopping += score.shopping
    nightlife += score.nightlife
    outdoor += score.outdoor
    luxury += score.luxury
    weather += score.weather
    zen += score.zen
    end

    @score = Score.create(
      artsy: artsy,
      authentic: authentic,
      trendy: trendy,
      foodie: foodie,
      walkability: walkability,
      touristy: touristy,
      shopping: shopping,
      nightlife: nightlife,
      outdoor: outdoor,
      luxury: luxury,
      weather: weather,
      zen: zen
      )
  end
end