class Term < ActiveRecord::Base
  
  include GraphUtils::InstanceMethods
  extend  GraphUtils::ClassMethods

  serialize :similars, Array
  attr_accessible :name, :similars
    

end
