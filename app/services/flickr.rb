class Flickr
  AUTH_ENDPOINT = 'http://flickr.com/services/auth/'
  API_ENDPOINT  = 'http://flickr.com/services/rest/'
  API_KEY       = ENV['FLICKR_KEY']
  SECRET        = ENV['FLICKR_SECRET']
  
   attr_accessor :params, :signed_request, :method, :cache_key

   def initialize(options = {})
    options.reverse_merge!(:type => :api, :params => {})
    @params = { :api_key => API_KEY }.merge(options[:params])
    @endpoint = self.class.const_get("#{options[:type].to_s.upcase}_ENDPOINT".to_sym)
    @method = options[:method] || nil
    @signed_request = options[:signed_request] || false
    @cache_key = options[:cache_key] || false
  end