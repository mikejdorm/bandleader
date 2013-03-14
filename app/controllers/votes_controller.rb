class VotesController < ApplicationController


  def new
    @vote = Vote.new
 
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vote }
    end
  end
 
def show
   @vote = Vote.new
end

  def create
    @vote = Vote.new(params[:vote])
	@song = Song.find_by_id(@vote.song_id) 
	@station = Station.find_by_id(@vote.station_id)
	@songs = @station.songs.all(:conditions => 'broadcast_time IS NULL')
	respond_to do |format|
          if @vote.save
          	  format.js 
			  format.html # new.html.erb
			  format.xml  { render :xml => @vote }
   		 end
    end
end


end
