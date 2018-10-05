module PaymentGateway
  module ForAll
    class Base
      class PublicKeyNotFound < StandardError; end
      class GatewayError      < StandardError; end

      API_URL = 'https://gateway.homolog-interna.4all.com'

      def initialize
        @public_key = PaymentGateway::ForAll.configuration.public_key
        raise PublicKeyNotFound if @public_key.blank?
      end

      protected

      def request(method, url, options={ headers: {}, body: {}, params: {} })
        headers = { 'Content-Type' => 'application/json' }
        headers.merge!(options[:headers]) unless options[:headers].nil?
        options[:body].merge({'publicApiKey': @public_key})
        response = HTTP.
            headers('Content-Type' => 'application/json').
            send(method, url, json: options[:body])
        if response.status.eql?(200)
          response.parse.with_indifferent_access
        else
          error_message = "#{response.status} - #{response.parse['errors'] || response.parse['message']}"
          raise GatewayError, error_message
        end
      end
    end
  end
end