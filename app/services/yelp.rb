class Yelp
  API_HOST = "https://api.yelp.com"
  SEARCH_PATH = "/v3/businesses/search"
  BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
  TOKEN_PATH = "/oauth2/token"
  GRANT_TYPE = "client_credentials"


  DEFAULT_BUSINESS_ID = "yelp-san-francisco"
  DEFAULT_TERM = "dinner"
  DEFAULT_LOCATION = "San Francisco, CA"
  SEARCH_LIMIT = 7


  def bearer_token
    # Put the url together
    url = "#{API_HOST}#{TOKEN_PATH}"


    # Build our params hash
    params = {
        client_id: ENV["CLIENT_ID"],
        client_secret: ENV["CLIENT_SECRET"],
        grant_type: GRANT_TYPE
    }

    response = HTTP.post(url, params: params)
    parsed = response.parse

    "#{parsed['token_type']} #{parsed['access_token']}"
  end

  def search(term, location)
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
        term: term,
        location: location,
        limit: SEARCH_LIMIT
    }

    response = HTTP.auth(bearer_token).get(url, params: params)
    response.parse
  end

  response = search("seafood", "Lisbon")

  puts response

  user_id = 1

  response["businesses"].each do |biz|
    resto = Place.new(
        name: biz["name"],
        address: biz["location"]["display_address"].join(" "),
        phone: biz["phone"],
        email: Faker::Internet.email,
        img_url: biz["image_url"],
        distrikt_id: biz["url"],
        score_id: ""
    )
    resto.save
  end
end