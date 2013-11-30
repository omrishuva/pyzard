require 'csv'

namespace :import_data do

  desc "import terms similarities from csv"

  task :genres => :environment do
    not_found_genres =[]
    
    genres_array = EchoNestCache.get(:genre_list).data.map{ |genre| genre["name"] }
    
    genres_array.each do |genre|
      genre_obj = Genre.new(name:genre)
      
      if Dir["/Users/omrishuva/Desktop/pyzard/term_similarity/#{genre}"].present?
      
        CSV.foreach("/Users/omrishuva/Desktop/pyzard/term_similarity/#{genre}") do |row|
          genre_obj.similars << row[1] if genres_array.include? row[1]
        end
      else
        not_found_genres << genre
      end
      genre_obj.save
    end
     
     File.open("/Users/omrishuva/Desktop/pyzard/term_similarity/not_found_genres",'w+') do |f|
        f.puts not_found_genres
     end 
  end

  task :moods => :environment do
    not_found_moods =[]
    
    moods_array = EchoNestCache.get(:mood_list).data.map{ |mood| mood["name"] }
    
    moods_array.each do |mood|
      mood_obj = Mood.new(name:mood)
      
      if Dir["/Users/omrishuva/Desktop/pyzard/term_similarity/#{mood}"].present?
      
        CSV.foreach("/Users/omrishuva/Desktop/pyzard/term_similarity/#{mood}") do |row|
          mood_obj.similars << row[1] if moods_array.include? row[1]
        end
      else
        not_found_moods << mood
      end
      mood_obj.save
    end
     
     File.open("/Users/omrishuva/Desktop/pyzard/term_similarity/not_found_moods",'w+') do |f|
        f.puts not_found_moods
     end 
  end

  task :terms => :environment do
    not_found_terms =[]
    
    terms_array = EchoNestCache.get(:term_list).data.map{ |term| term["name"] }
    
    terms_array.each do |term|
      term_obj = Term.new(name:term)
      
      if Dir["/Users/omrishuva/Desktop/pyzard/term_similarity/#{term}"].present?
      
        CSV.foreach("/Users/omrishuva/Desktop/pyzard/term_similarity/#{term}") do |row|
          term_obj.similars << row[1] if terms_array.include? row[1]
        end
      else
        not_found_terms << term
      end
      term_obj.save
    end
     
     File.open("/Users/omrishuva/Desktop/pyzard/term_similarity/not_found_terms",'w+') do |f|
        f.puts not_found_terms
     end 
  end




end