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
      attr_accessor :access_key

      def initialize
        @public_key = nil
      end
    end
  end
end