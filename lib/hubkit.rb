require "active_support/core_ext/hash"
require "httparty"
require "hashie"
require "hubkit/version"
require "hubkit/client"

module Hubkit
  class Error < StandardError; end
  class UnauthorizedError < Error; end

  class << self
    def client
      return @client if defined?(@client)
      @client = Hubkit::Client.new(options)
    end
  end
end
