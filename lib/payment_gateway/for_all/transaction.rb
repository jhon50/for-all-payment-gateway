module PaymentGateway
  module ForAll
    class Transaction < Base
      attr_accessor :transaction_id

      # You can pass card_token or card_nonce to this method
      # card_nonce expires in 30 minutes, but the token is permanent.
      def create(card_token)
        self.transaction_id = request(:post, endpoint, body: build_transaction_body(card_token))
      end

      # TO-DO
      # def capture(transaction_id)
      #
      # end

      private

      def endpoint
        API_URL + '/createTransaction'
      end

      def build_transaction_body(card_token)
        {
            "merchantKey": merchant_key,
            "amount": 7500,
            "installmentType": 0,
            "installments": nil,
            "metaId": "AF85GHQ97A",
            "overwriteMetaId": false,
            "paymentMethod": build_payment_method(card_token),
            "customerInfo": build_customer_info,
            "autoCapture": false,
            "postbackURL": "www.example.com/postback/",
            "metadata": nil
        }
      end

      def build_payment_method(card_token)
        {
            "cardNonce":  card_token,
            "cardBrandId": 1,
            "cardToken": nil,
            "paymentMode": 1,
            "dueDate": nil,
            "softDescriptor": "Dr. Zeus Inc.",
            "forceSplit": false
        }
      end

      def build_customer_info
        {
            "fullName": "Joao Silva",
            "cpf": "091.544.560-37",
            "cnpj": nil,
            "phoneNumber": "515818282",
            "birthday": "1994-05-02",
            "emailAddress": "joao@email.com",
            "zipCode": "902848",
            "address": "Rua exemplo 123",
            "neighborhood": "Bairro examplo",
            "city": "Cidade exemplo",
            "state": "Estado exemplo"
        }
      end
    end
  end
end
