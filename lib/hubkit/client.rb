require "hubkit/client/connection"

require "hubkit/client/contacts"
require "hubkit/client/deals"

module Hubkit
  class Client
    include HTTParty
    include Hubkit::Client::Connection
    include Hubkit::Client::Contacts
    include Hubkit::Client::Deals

    base_uri "https://api.hubapi.com"
    format :json

    def initialize(options = {})
      # Loop through potential options. Can be extended to set default values.
      %w(oauth_token token_expires_in refresh_token client_id client_secret authentication_callback).each do |key|
        value = options.has_key?(key.to_sym) ? options[key.to_sym] : nil
        instance_variable_set(:"@#{key}", value) if value
      end

      self.class.default_options.merge!(
        headers: {
          'Authorization' => "Bearer #{@oauth_token}"
        }
      )
    end

    def oauth_token=(value)
      @oauth_token = value
      self.class.default_options.merge!(headers: { 'Authorization' => "Bearer #{@oauth_token}" })
    end

    def token_expires_in=(value)
      @token_expires_in = value
    end
  end
end
