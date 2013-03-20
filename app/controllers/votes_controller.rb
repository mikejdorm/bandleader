class VotesController < ApplicationController

before_filter :authorize


 def show
  	 @vote = Vote.new
 end

 def create
    @vote = Vote.new(params[:vote])
	respond_to do |format|
          if @vote.save
          	  format.js 
   		 end
    end
 end


end
