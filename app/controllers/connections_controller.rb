class ConnectionsController < ApplicationController

before_filter :authorize

  def create
    @connection = Connection.new(params[:connection])
    check = Connection.find(:first, :conditions => ["user_id = ? AND station_id = ?", @connection.user_id, @connection.station_id ])
    if check.nil?
		if @connection.save
			redirect_to Station.find_by_id(@connection.station_id)
		else
  		#render 'new'
  		redirect_to stations_url
  		end
  	else
  		redirect_to Station.find_by_id(@connection.station_id)
  	end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
  
end
