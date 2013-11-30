require 'csv'

CSV.open("/Users/omrishuva/Desktop/pyzard/genre", "wb") do |csv|

  Genre.all.each do |genre|
    csv << [genre.id , genre.name]
  end  
  
  csv << []
  
  Genre.all.each do |genre|
    genre.similars_obj.each do |similar_obj|
      csv << [genre.id, similar_obj.id]
    end  
  end  

end
# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed
