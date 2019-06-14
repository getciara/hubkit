module Hubkit
  class Client
    module Dispositions
      def get_dispositions
        get('/calling/v1/dispositions')
      end
    end
  end
end
