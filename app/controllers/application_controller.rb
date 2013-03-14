class ApplicationController < ActionController::Base
  protect_from_forgery
private

  def current_user
  	
  	if(session[:user_id])
   		 @current_user ||= User.find(session[:user_id])
    else 
    	@current_user = nil
    end
  end
  helper_method :current_user
  
  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
end
