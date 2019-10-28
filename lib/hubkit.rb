require "active_support/core_ext/hash"
require "httparty"
require "hashie"
require "hubkit/version"
require "hubkit/client"
require "hubkit/error"

module Hubkit
  class UnauthorizedError < Error; end
  class ConnectionError < Error; end
  class ForbiddenError < Error; end
  class LimitError < Error; end

  class << self
    def client
      return @client if defined?(@client)
      @client = Hubkit::Client.new(options)
    end
  end
end
