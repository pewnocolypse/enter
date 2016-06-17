class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def common_thing
  	include SesssionsHelper
  end
  	
 
  protect_from_forgery 
  
end
