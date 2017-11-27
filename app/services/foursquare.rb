class Foursquare

  BASE_URL = "https://api.foursquare.com/v2/"
  FS_CLIENT_ID = ENV["FS_ID"]
  FS_CLIENT_SECRET = ENV["FS_SECRET"]

  def initialize(distrikt, filter)
    @distrikt = distrikt
    @filter = filter
  end

  def venue_search_url
    BASE_URL + "venues/explore?" + {
      client_id: FS_CLIENT_ID,
      client_secret: FS_CLIENT_SECRET,
      v: "20170801",
      ll: "#{@distrikt.latitude},#{@distrikt.longitude}",
      query: @filter,
      limit: 10
    }.to_query
  end

  def photo_search_url(venue_id)
    url = BASE_URL + "venues/" + venue_id + "/photos?" + {
      client_id: FS_CLIENT_ID,
      client_secret: FS_CLIENT_SECRET,
      v: "20170801",
      limit: 1
    }.to_query

    raw = connect.get url
    result = JSON.load(raw.body)
    result["response"]["photos"]["items"].first
  end

  def connect
    Faraday.new(url: BASE_URL) do |faraday|
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end
  end

  def establishments
    get_establishments.map { |i| i['venue'] }
  end

  def get_establishments
    venue = JSON.load(get_establishments_raw.body)
    venue.map { |v| venue['response']['groups'].first['items'] }.flatten
  end

  def get_establishments_raw
    connect.get venue_search_url
  end

end








