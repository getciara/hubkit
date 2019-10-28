require 'pp'

module Hubkit
  class Error < StandardError
    attr_reader :extra
    def initialize(message = 'An Hubkit Error occured.', extra = nil)
      @extra = extra
      super(message)
    end
  end
end
