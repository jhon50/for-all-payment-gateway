module PaymentGateway
  module ForAll
    class Card < Base

      # {
      #   "type": 1,
      #   "cardholderName": "JOHN SMITH",
      #   "cardNumber": "4024007126652816",
      #   "expirationDate": "0119",
      #   "securityCode": "123"
      # }
      def initialize(card_data)
        @card_data = card_data
      end

      def get_nonce
        request(:post, endpoint_nonce, body: build_card_body)
      end

      def get_token
        response = get_nonce
        request(:post, endpoint_token, body: build_get_token_body(response[:cardNonce]))
      end

      private

      def endpoint_nonce
        api_url + '/prepareCard'
      end

      def endpoint_token
        api_url + '/createCardToken'
      end

      def build_card_body
        {
            "accessKey": access_key,
            "cardData": {
                "type": @card_data[:type],
                "cardholderName": @card_data[:cardholderName],
                "cardNumber": @card_data[:cardNumber],
                "expirationDate": @card_data[:expirationDate],
                "securityCode": @card_data[:securityCode]
            }
        }
      end

      def build_get_token_body(card_nonce)
        {
            cardNonce: card_nonce
        }
      end
    end
  end
end