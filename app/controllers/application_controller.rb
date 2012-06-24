class ApplicationController < ActionController::Base
  before_filter :set_locale

  rescue_from AuthenticationError, with: :access_denied_error
  
  helper :all # include all helpers, all the time
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    access_denied_error
  end
  
  
  def access_denied_error
    flash[:error] = "Please contact info@kabupaten.org if you would like to be a contributor."
    # Avoid redirect loop, which happens when the redirect is to a page where the user no longer has access to
    request.env['HTTP_REFERER'] == request.env['REQUEST_URI'] ? redirect_to(default_dashboard) : redirect_to(:back)
  end
  
  def authenticate
    authenticate_or_request_with_http_basic do |username, password| 
      valid_user = (username == ENV['BASIC_AUTH_NAME'] && password == ENV['BASIC_AUTH_PASSWORD'])
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
  
  def set_locale
    I18n.locale = extract_locale_from_subdomain || I18n.default_locale
  end
  
  # Get locale code from request subdomain (like http://it.application.local:3000)
  # You have to put something like:
  #   127.0.0.1 gr.application.local
  # in your /etc/hosts file to try this out locally
  def extract_locale_from_subdomain
    parsed_locale = request.subdomains.first
    I18n.available_locales.include?(parsed_locale.try(:to_sym)) ? parsed_locale : nil
  end
  
private

end
