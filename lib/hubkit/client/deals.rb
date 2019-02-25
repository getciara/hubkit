module Hubkit
  class Client
    module Deals
      def create_deal(properties, associations = {})
        deal = {
          "properties" => properties
        }
        deal["associations"] = associations unless associations.empty?
        post("/deals/v1/deal", { body: deal.to_json })
      end

      def update_deal()
        # TODO
      end

      def update_deals()
        # TODO
      end

      def deals(options = {})
        get('/deals/v1/deal/paged', { query: options })
      end

      def recently_modified_deals()
        # TODO
      end

      def recently_created_deals()
        # TODO
      end

      def delete_deal()
        # TODO
      end

      def deal(deal_id, options = {})
        get("/deals/v1/deal/#{deal_id}", { query: options })
      end

      def deal_properties
        get('/properties/v1/deals/properties')
      end
    end
  end
end
