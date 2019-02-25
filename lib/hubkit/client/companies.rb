module Hubkit
  class Client
    module Companies
      def companies(options = {})
        get('/companies/v2/companies/paged', { query: options })
      end

      def company(vid)
        get("/companies/v2/companies/#{vid}")
      end

      def company_properties
        get('/properties/v1/companies/properties')
      end
    end
  end
end
