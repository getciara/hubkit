module Hubkit
  class Client
    module Pipelines
      def pipelines(object_type, options = {})
        get("/crm-pipelines/v1/pipelines/#{object_type}", { query: options })
      end
    end
  end
end
