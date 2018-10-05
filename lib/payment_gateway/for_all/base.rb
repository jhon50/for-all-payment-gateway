module PaymentGateway
  module ForAll
    class Base
      API_URL = ''

      def initialize
        public_key = PaymentGateway::ForAll.configuration.public_key
      end

    end
  end
end