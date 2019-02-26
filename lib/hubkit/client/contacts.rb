module Hubkit
  class Client
    module Contacts
      def contacts(options = {})
        get('/contacts/v1/lists/all/contacts/all', { query: options })
      end

      def contacts_by_id(vids, options = {})
        options['vid'] = vids
        get('/contacts/v1/contact/vids/batch/', { query: options })
      end

      def contact_by_id(vid, options = {})
        get("/contacts/v1/contact/vid/#{vid}/profile", { query: options })
      end

      def contact_by_email(email, options = {})
        get("/contacts/v1/contact/email/#{email}/profile", { query: options })
      end

      def contact_properties
        get('/properties/v1/contacts/properties')
      end
    end
  end
end
