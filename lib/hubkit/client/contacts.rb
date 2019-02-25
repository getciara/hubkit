module Hubkit
  class Client
    module Contacts
      def contacts(options = {})
        get('/contacts/v1/lists/all/contacts/all', { query: options })
      end

      def contact_by_id(vid, options = {})
        get("/contacts/v1/contact/vid/#{vid}/profile", { query: options })
      end

      def contact_by_email(email, options = {})
        get("/contacts/v1/contact/email/#{email}/profile", { query: options })
      end
    end
  end
end
