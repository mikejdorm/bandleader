class SessionsController < ApplicationController

 def new
  end
  
  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to stations_url, notice: "Logged in!"
    else
      flash.now.alert = "Username or password is invalid"
      render "new"		
    end
  end
  
  def destroy
   reset_session
    redirect_to root_url
  end
  
end
