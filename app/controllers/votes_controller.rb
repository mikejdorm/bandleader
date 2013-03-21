class VotesController < ApplicationController

before_filter :authorize

 def show
  	 @vote = Vote.new
 end

 def create
    @vote = Vote.new(params[:vote])
    station = Station.find_by_id(@vote.station_id)
    @songs = Song.where("broadcast_time IS NULL AND station_id = ?", station.id)
	respond_to do |format|
          if @vote.save
          	  format.js 
   		 end
    end
 end


end
