class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.

    add_flash_types :danger, :info, :warning, :success

    protect_from_forgery with: :exception
    include SessionsHelper

    Google::Maps.configure do |config|
  config.authentication_mode = Google::Maps::Configuration::API_KEY
  config.api_key = 'AIzaSyB67HJnfJOIlyBoeagBpfvIzXniJaql1dA'
end

Google::Maps.configure do |config|
  config.default_language = :en
end
end
