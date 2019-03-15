require 'http'
module PaymentGateway
  module ForAll
    class Base
      class MerchantKeyNotFound < StandardError; end
      class GatewayError      < StandardError; end

      def initialize
        raise MerchantKeyNotFound if PaymentGateway::ForAll.configuration.merchant_key.blank?
      end

      protected

      def request(method, url, options={ body: {}, params: {} })
        options[:body].merge!({'merchantKey': PaymentGateway::ForAll.configuration.merchant_key})
        response = HTTP.
            headers('Content-Type' => 'application/json').
            send(method, url, json: options[:body].with_indifferent_access)
        if response.status.eql?(200)
          response.parse.with_indifferent_access
        else
          error_message = "#{response.status} - #{response.parse['error']['message']}"
          raise GatewayError, error_message
        end
      end

      def api_url
        PaymentGateway::ForAll.configuration.environment
      end

      def access_key
        access_key = PaymentGateway::ForAll.configuration.access_key
        access_key.blank? ? Vault.new.request_key : access_key
      end
    end
  end
end