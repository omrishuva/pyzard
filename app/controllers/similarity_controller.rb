class SimilarityController < ApplicationController

  def index
    @types = [:terms, :genres, :moods ]
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @types }
    end  
  end  
end
