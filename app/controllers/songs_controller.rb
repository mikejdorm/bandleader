class SongsController < ApplicationController

before_filter :authorize

  # GET /songs/new
  # GET /songs/new.json
  def new
    @song = Song.new
    @station = Station.last
   #sleep 1 #development only, simulates wait time
	  respond_to do |format|
		#format.html { redirect_to root_path } #for my controller, i wanted it to be JS only
		format.js
	  end
  end

def upload
 	 begin
    @song = Song.new
    @station = Station.find_by_id(params['station_id'])
	lastfm = Lastfm.new(ENV['LAST_FM_KEY'], ENV['LAST_FM_SECRET'])
	@song.parse_tags(params[:mp3file].original_filename, params[:mp3file].tempfile)
	obj = @song.create_s3object(params[:mp3file])
	@song.create_url(obj)
	@song.station_id = params['station_id']
	info = lastfm.album.get_info(:artist => @song.artist, :album => @song.album)
	@song.setSongInfo(info)
	rescue Exception => e
		puts "Errror encountered: #{e}"
	end
	@song.link = @song.create_url(obj)
    respond_to do |format|
      if @song.save
      	    format.html
      	    if @station.songs.count == 1
      	    	format.js { render :js => "window.location.href = '#{@station.id}'" }
      	    else
      			format.js 
      		end
      else 
      	render :js => "window.location.href = '#{@station.id}'"
      end
    end
  end
  

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @station = Station.find_by_id(params[:station_id]);
    @song = Song.find(params[:id])
    @song.broadcast_time = Time.now
    respond_to do |format|
      format.html { redirect_to @station }
      format.json { head :no_content }
    end
  end
end
