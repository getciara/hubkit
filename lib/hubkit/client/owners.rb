module Hubkit
  class Client
    module Owners
      def get_owner(owner_id)
        get("/owners/v2/owners/#{owner_id}")
      end

      def get_owners(options = {})
        get("/owners/v2/owners?#{options.to_query}")
      end
    end
  end
end
