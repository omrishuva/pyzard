module Echonest
  
  class Artist < Base
    
    include WikiBox

    attr_accessor :obj, :obj_type

    def initialize(name)
      super
      @obj_type = "artist"
      @obj = get(search_artist_url(name))["artists"].first   
    end
    
    def songs(limit = 20)
      songs = "#{base_uri}/#{obj_type}/songs?api_key=#{api_key}&id=#{obj['id']}#{format_param}&results=#{limit}"
       get(songs)["songs"]
    end
    
    def biographies(license_type = nil )
      licenses = ["echo-source", " all-rights-reserved", " cc-by-sa", " cc-by-nc", " cc-by-nc-nd", " cc-by-nc-sa", " cc-by-nd", " cc-by", " public-domain", " unknown"]
      url = "#{biographies}/#{obj_type}/biographies?api_key=#{api_key}&id=#{obj['id']}#{format_param}&results=#{limit}"
      get(url)["biographies"]
    end
    
    def blogs(limit = 10, high_relevance = true)
      url = "#{base_uri}/#{obj_type}/blogs?api_key=#{api_key}&id=#{obj['id']}#{format_param}&results=#{limit}&high_relevance=#{high_relevance}"
      get(url)["blogs"]
    end

    def urls(limit)
      url = "#{base_uri}/#{obj_type}/urls?api_key=#{api_key}&id=#{obj['id']}#{format_param}results=#{limit}"
      get(url)["urls"]
    end
    
    def search_artist_url(name, limit = 1)
      "#{base_uri}/#{obj_type}/search?api_key=#{api_key}&name=#{URI.encode(name)}&results=#{limit}"
    end

  end

end