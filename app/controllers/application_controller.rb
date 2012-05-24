class ApplicationController < ActionController::Base
  rescue_from AuthenticationError, with: :access_denied_error
  
  helper :all # include all helpers, all the time
  protect_from_forgery
  
  def access_denied_error
    flash[:error] = "Please contact info@kabupaten.org if you would like to be a contributor."
    # Avoid redirect loop, which happens when the redirect is to a page where the user no longer has access to
    request.env['HTTP_REFERER'] == request.env['REQUEST_URI'] ? redirect_to(default_dashboard) : redirect_to(:back)
  end
  
  def authenticate
    authenticate_or_request_with_http_basic do |username, password| 
      valid_user = (username == APP_CONFIG["basic_auth_name"] && password == APP_CONFIG["basic_auth_password"])
      if !valid_user && session[:denied_user].present?
        session[:denied_user] = nil
        false
      elsif !valid_user
        session[:denied_user] = username
        raise AuthenticationError
      elsif valid_user
        session[:denied_user] = nil
        true
      end
    end
  end
  
private

end
