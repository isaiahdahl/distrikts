class Flickr

  def initialize
    FlickRaw.api_key = ENV['FLICKR_KEY']
    FlickRaw.shared_secret = ENV['FLICKR_SECRET']
  end

  def search(lat, lon)
    geo = flickr.places.findByLatLon(lat: lat, lon: lon)
    place_id = geo[0]["place_id"]
    flickr.photos.search(place_id: place_id).map do |pic|
      "https://farm#{pic["farm"]}.staticflickr.com/#{pic["server"]}/#{pic["id"]}_#{pic["secret"]}.jpg"
    end

  end
end