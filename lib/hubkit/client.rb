require "hubkit/client/connection"

require "hubkit/client/associations"
require "hubkit/client/contacts"
require "hubkit/client/companies"
require "hubkit/client/deals"
require "hubkit/client/pipelines"
require "hubkit/client/engagements"

module Hubkit
  class Client
    include HTTParty
    include Hubkit::Client::Connection
    include Hubkit::Client::Associations
    include Hubkit::Client::Contacts
    include Hubkit::Client::Companies
    include Hubkit::Client::Deals
    include Hubkit::Client::Pipelines
    include Hubkit::Client::Engagements

    base_uri "https://api.hubapi.com"
    format :json

    query_string_normalizer proc { |query|
      query.map do |key, value|
        if value.is_a?(Array)
          value.map {|v| "#{key}=#{v}"}
        else
          {key => value}.to_query
        end
      end.flatten.sort.join('&')
    }

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
