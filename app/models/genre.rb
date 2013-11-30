class Genre < ActiveRecord::Base
   serialize :similars, Array
   attr_accessible :name, :similars

   include GraphUtils::InstanceMethods
   extend  GraphUtils::ClassMethods
   
end
