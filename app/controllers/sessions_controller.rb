class SessionsController < ApplicationController

 def new
  end
  
  def create
    user = User.find_by_username(params[:username])
      	puts "signing in user with user id #{user.id}"
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to connect_url, notice: "Logged in!"
    else
      flash.now.alert = "Username or password is invalid"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
  
end