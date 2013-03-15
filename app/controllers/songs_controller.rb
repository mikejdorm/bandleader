class SongsController < ApplicationController
  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @songs }
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find(params[:id])
    respond_to do |format|
      format.js 
      format.html # show.html.erb
      format.json { render json: @song }
    end
  end

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

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
  end
  
  def upload
  begin
    @song = Song.new
    puts "creating song using #{params[:mp3file]}"
    @station = Station.find_by_id(params['station_id'])
    puts "station is set as #{@station}"
    puts "now opening last fm api" 
	lastfm = Lastfm.new('7a3265c5d611cb7a75c65d269593cd93', '16173be5d466e200dcda3ff71b69322b')
	puts "last fm api set.now parsing song" 
	puts "song parsed using #{params[:mp3file].original_filename} and #{params[:mp3file].tempfile}"
	@song.parse_tags(params[:mp3file].original_filename, params[:mp3file].tempfile)
	puts "song parsed" 
	obj = @song.create_s3object(params[:mp3file])
	puts "song is now set as #{@song}"
	@song.create_url(obj)
	puts "url creating for song" 
	@song.station_id = params['station_id']
	puts "station id set. now making call to last fm" 
	@song.info = lastfm.album.get_info(:artist => @song.artist, :album => @song.album)
	puts "album info is now set" 
	if @song.info['image'][1]["content"] == nil
		@song.info = lastfm.artist.get_info(:artist => @song.artist)
	end
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



  # PUT /songs/1
  # PUT /songs/1.json
  def update
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
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
