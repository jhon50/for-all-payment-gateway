module PaymentGateway
  module ForAll
    class Transaction < Base

      # POST
      # Create Transaction
      #
      # {
      #     "merchantKey": "xxxxxxxxxxxxxxxxx",
      #     "amount": 7500,
      #     "metaId": "random number, token or code",
      #     "overwriteMetaId": false,
      #     "paymentMethod": [
      #       {
      #         "cardNonce": "xxxxxxxxxxxxxxxxx",
      #         "cardBrandId": 2,
      #         "paymentMode": 1,
      #         "installmentType": 1,
      #         "installments": 1,
      #         "softDescriptor": "Dr. Zeus Inc.",
      #         "amount": 7500,
      #         "forceSplit": false
      #       }
      #     ],
      #     "customerInfo": {
      #       "fullName": "Joao Silva",
      #       "cpf": "02700790090",
      #       "phoneNumber": "515818282",
      #       "birthday": "1994-05-02",
      #       "emailAddress": "joao@email.com",
      #       "zipCode": "902848",
      #       "address": "Rua exemplo 123",
      #       "neighborhood": "Bairro examplo",
      #       "city": "Cidade exemplo",
      #       "state": "Estado exemplo"
      #     },
      #     "autoCapture": true,
      #     "postbackURL": "www.example.com/postback/"
      #   }
      def create(body)
        request(:post, endpoint_create, body: body)
      end

      # POST
      # Capture Transaction
      #
      # {
      #   "merchantKey": "0123456789ABCDEF01...",
      #   "transactionId": "1843246811",
      #   "metaId": null,
      #   "amount": null
      # }
      def capture(body)
        request(:post, endpoint_capture, body: body)
      end

      private

      def endpoint_create
        API_URL + '/createTransaction'
      end

      def endpoint_capture
        API_URL + '/captureTransaction'
      end
    end
  end
end
