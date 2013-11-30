class GraphUtils

  module InstanceMethods
    
    def get_paths
      
      #paths ||= Containers::Trie.new
      
      @@start_term ||= name
      @@used_similars ||= [name]
      
      until similars_obj.nil?
        similars_obj.each do |similar_obj|
          
          similar_obj.similars_obj.each do |second_degree_similar_obj|
            
            paths.push("#{@@start_term}_#{similar_obj.name}",)
          end

          @@used_similars.push(similars).flatten! 
        end
        get_paths
      end     
      paths
    end

    def uniq_similars
      if !(@@used_similars.size == 1)
        similars - @@used_similars
      else
        similars
      end
    end
    
    def similars_obj
      self.class.where(name: similars)
    end
  
  end 
  
  module ClassMethods
    
    def get_paths
      paths = Containers::Trie.new

      self.all.each do |term|
        genre.similars.each do |similar_genre|
            paths.push("#{genre.name}")
          paths.push(genre.name, similar_genre)
        end
      end
      paths
    end
  end
  
end