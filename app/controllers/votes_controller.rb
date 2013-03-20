class VotesController < ApplicationController

before_filter :authorize

 def show
  	 @vote = Vote.new
 end

 def create
    @vote = Vote.new(params[:vote])
    station = Station.find_by_id(@vote.station_id)
    @songs = station.songs.all(:conditions => 'broadcast_time IS NULL')
	respond_to do |format|
          if @vote.save
          	  format.js 
   		 end
    end
 end


end
