module Hubkit
  class Client
    module Associations
      def associations_for(object_id, definition_id, options = {})
        get("crm-associations/v1/associations/#{object_id}/HUBSPOT_DEFINED/#{definition_id}", { query: options })
      end
    end
  end
end
