module Hubkit
  class Client
    module Engagements
      def create_engagement(engagement, metadata, associations = {})
        engagement_object = {
          'engagement' => engagement,
          'metadata' => metadata,
        }
        engagement_object['associations'] = associations unless associations.empty?
        post('/engagements/v1/engagements', { body: engagement_object.to_json })
      end

      def get_engagements
        get('/engagements/v1/engagements/paged')
      end

      def update_engagement(engagement_id, metadata, engagement = {}, associations = {})
        engagement_object = {
          'metadata' => metadata,
        }
        engagement_object['engagement'] = engagement unless engagement.empty?
        engagement_object['associations'] = associations unless associations.empty?
        put("/engagements/v1/engagements/#{engagement_id}", { body: engagement_object.to_json })
      end
    end
  end
end
