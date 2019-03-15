module PaymentGateway
  module ForAll
    class << self
      attr_accessor :configuration
    end

    def self.configure
      yield(configuration)
    end

    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.reset
      @configuration = Configuration.new
    end

    class Configuration
      attr_accessor :public_key
      attr_accessor :merchant_key
      attr_accessor :environment

      def initialize
        @public_key   = nil
        @merchant_key = nil
        @environment  = nil
      end
    end
  end
end