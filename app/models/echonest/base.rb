module Echonest
  
  require 'net/http'
  require 'open-uri'
    
  class Base
    
    attr_reader :api_key, :format_param, :type_param, :base_uri 
    
    def initialize(a=nil, b=nil, c=nil, d=nil)
      #fma api key V0WW33WGEONOGDAV
      @format_param  = "&format=json"
      @type_param = "&type="
      @base_uri = "http://developer.echonest.com/api/v4"
      @api_key = "RN12NDIOWXSSXHSMT"
    end
    
    private
    
    def get(url)
      (JSON.parse Net::HTTP.get(URI.parse url))["response"]
    end
    
    def to_multiple_param_string(objects_array, type)
      objects_array.map{ |obj| "#{type}=#{obj}"  }.join("&")
    end
  
  end
end