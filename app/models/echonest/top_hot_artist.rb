module Echonest
  class TopHotArtist < Base
  
    attr_accessor :data, :genres, :bucket_array, :bucket_string, :genre_string, :top_hot_url, :limit, :page
    
    def initialize( genres, page = 0 ,limit = 15, bucket = [])
      super
      @limit = 15
      @page  = page
      @genres = format_genre_params genres
      @bucket_array = bucket.present? ? bucket : defualt_bucket
      @bucket_string = to_multiple_param_string(bucket_array, "bucket")
      @genre_string = to_multiple_param_string(@genres, "genre")
      @top_hot_url = "#{base_uri}/artist/top_hottt?api_key=#{api_key}#{format_param}&#{genre_string}&#{bucket_string}&results=#{limit}&start=#{limit * page}"
      @data = fetch_top_hot_artists
    end
        
    def list_names
      @list_names ||= data.map{ |artist| artist["name"] }
    end
    
    private
    
    def fetch_top_hot_artists
      get(top_hot_url)["artists"]
    end

    def format_genre_params(genres)
      genres.map{ |genre| genre.split(" ").join("+") }
    end

    def defualt_bucket
      ["familiarity","hotttnesss","images","artist_location","news","reviews","songs","terms","urls","video","years_active"]
    end
  
  end
end