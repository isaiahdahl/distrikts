class Foursquare

  BASE_URL = "https://api.foursquare.com/v2/"

  def initialize(distrikt, filter)
    @distrikt = distrikt
    @filter = filter
  end

  def venue_search_url
    BASE_URL + "venues/explore?" + {
      client_id: ENV["FS_ID"],
      client_secret: ENV["FS_SECRET"],
      v: "20170801",
      ll: "#{@distrikt.latitude},#{@distrikt.longitude}",
      query: @filter,
      limit: 10
    }.to_query
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








