# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
 
  def initialize
    @username = "teacher"
    @password = "kickin4jesus"
  end
  
    def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == @username && password == @password && session[:logged_out] != true
    end
    session[:logged_out] = nil
  end
  
  def logged_out
    session[:logged_out] = true
  end
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'adf8184c5e4db177be18a45c87f3824c'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
end
