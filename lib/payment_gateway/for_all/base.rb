require 'http'
require 'pry-rails'
module PaymentGateway
  module ForAll
    class Base
      class PublicKeyNotFound < StandardError; end
      class GatewayError      < StandardError; end

      API_URL = 'https://gateway.homolog-interna.4all.com'

      def initialize
        @public_key = PaymentGateway::ForAll.configuration.public_key
        # remove this to assure public key is present!
        # raise PublicKeyNotFound if @public_key.blank?
      end

      protected

      def request(method, url, options={ body: {}, params: {} })
        options[:body].merge!({'publicApiKey': 'zNkquQz38RbzzTl/GmzyZ5LO3/BBw8q97WlMMEzZBwo='})
        response = HTTP.
            headers('Content-Type' => 'application/json').
            send(method, url, json: options[:body].with_indifferent_access)
        if response.status.eql?(200)
          response.parse.with_indifferent_access
        else
          error_message = "#{response.status} - #{response.parse['errors'] || response.parse['message']}"
          raise GatewayError, error_message
        end
      end

      def access_key
        access_key = PaymentGateway::ForAll.configuration.access_key
        access_key.blank? ? Vault.new.request_key : access_key
      end

      def merchant_key
        # PaymentGateway::ForAll.configuration.merchant_key
        'C83zDb3wit+edGFF7jBWg6eN9R8S6Klgwl5ZN+BlNZw='
      end
    end
  end
end