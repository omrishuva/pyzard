module Echonest
  class Cache < Base

     attr_accessor  :data, :data_type

    class << self
      
      def get_data(data_type, options = {} )
        @data = {} if !@data
        @data[data_type.to_sym] ||= Echonest::Cache.new(data_type, options)
      end

      def clear_instances
        @instances = {}
      end
    
    end
    
    def initialize(data_type, options = {})
      super
      @data_type = data_type
      @data = fetch_data(options)
    end

    def fetch_data(options)
      case @data_type
        when :genre_list then fetch_genre_list
        when :mood_list  then fetch_mood_list
        when :term_list  then fetch_term_list
        when :top_artists then fetch_top_hot_artists(options)
      end
    end
    
    def fetch_genre_list
      genre_list_uri = URI.parse "#{base_uri}/artist/list_genres?api_key=#{api_key}"
      (JSON.parse Net::HTTP.get(genre_list_uri))["response"]["genres"].map{ |genre| genre["name"] }
    end  

    def fetch_term_list
      term_list_uri =  URI.parse "#{base_uri}/artist/list_terms?api_key=#{api_key}#{format_param}#{type_param}style"
      (JSON.parse Net::HTTP.get(term_list_uri))["response"]["terms"]
    end

    def fetch_mood_list
      mood_list_uri =  URI.parse "#{base_uri}/artist/list_terms?api_key=#{api_key}#{format_param}#{type_param}mood"
      (JSON.parse Net::HTTP.get(mood_list_uri))["response"]
    end  
    
  end
end