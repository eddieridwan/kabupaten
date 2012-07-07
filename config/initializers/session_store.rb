# Be sure to restart your server when you modify this file.

# Set domain so that logins work across all subdomains (used to represent locales)
# http://stackoverflow.com/questions/4203502/rails-3-no-local-session-cookie-with-domain-all
Kabupatenku::Application.config.session_store :cookie_store, key: '_kabupaten_session', 
  domain: "#{Rails.env == 'development' ? 'kabupaten.local' : 'kabupaten.com'}"

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Kabupatenku::Application.config.session_store :active_record_store
