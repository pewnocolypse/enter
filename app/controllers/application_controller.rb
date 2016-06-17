class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def logged_in
		!currentUser.nil?
	end
  	
  helper_method :logged_in
 
  protect_from_forgery 
  
end
