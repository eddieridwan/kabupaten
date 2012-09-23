# encoding: utf-8

# Tolk config file. Generated on September 23, 2012 17:46
# See github.com/tolk/tolk for more informations

Tolk.config do |config|

  # If you need to add a mapping do it like this :
  # May we suggest you use http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
  # config.mapping["fr-ES"] = 'Frañol !'

end

Tolk::ApplicationController.authenticator = proc {
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == ENV['TRANSLATOR_USERNAME'] && password == ENV['TRANSLATOR_PASSWORD']
    end
}