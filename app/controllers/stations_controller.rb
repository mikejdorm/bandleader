class StationsController < ApplicationController

before_filter :authorize

  # GET /stations
  # GET /stations.json
  def index
    @stations = Station.all
	@connection = Connection.new
	@station = Station.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stations }
    end
  end

def show
    @station = Station.find(params[:id])
    @songs = Song.where("broadcast_time IS NULL AND station_id = ?", @station.id)
    @now_playing = @station.songs.all(:conditions => 'broadcast_time IS NULL', :order => 'broadcast_time ASC').first
  	
  	if(@now_playing != nil)
  		puts("The artist is: #{@now_playing.artist}")
    	@song = Song.find_by_id(@now_playing.id)
    	@song.broadcast_time = Time.now
   	 	@song.save
    end
	@post = Post.new
	@song = Song.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @station }
    end
end

  # GET /stations/new
  # GET /stations/new.json
  def new
    @station = Station.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @station }
    end
  end
  
  # POST /stations
  # POST /stations.json
  def create
    @station = Station.new(params[:station])
    respond_to do |format|
      if @station.save
        format.html { redirect_to @station, notice: 'Station was successfully created.' }
        format.json { render json: @station, status: :created, location: @station }
      else
        format.html { render action: "new" }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    @station = Station.find(params[:id])
    @station.destroy
    respond_to do |format|
      format.html { redirect_to stations_url }
      format.json { head :no_content }
    end
  end
end
