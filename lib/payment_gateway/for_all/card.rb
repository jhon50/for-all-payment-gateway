module PaymentGateway
  module ForAll
    class Card < Base

      def prepare(card_data)
        request(:post, endpoint, body: build_card_body(card_data))
      end

      private

      def endpoint
        API_URL + '/prepareCard'
      end

      def build_card_body(card_data)
        {
            "accessKey": access_key,
            "cardData": {
                "type": 1,
                "cardholderName": "JOHN SMITH",
                "cardNumber": "4024007126652816",
                "expirationDate": "0119",
                "securityCode": "123"
            }
        }
      end
    end
  end
end