$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
# require "payment_gateway/version"

Gem::Specification.new do |spec|
  spec.name          = "for-all-payment-gateway"
  spec.version       = '1.0.1'
  spec.authors       = ["Jhonatan Teixeira"]
  spec.email         = ["johnn_lds@hotmail.com"]

  spec.summary       = %q{4All payment gateway SDK}
  spec.description   = %q{Easy integration with 4All payment gateway}
  spec.homepage      = "http://github.com/jhon50"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.


  spec.require_paths = ["lib"]
  spec.files         = `git ls-files`.split("\n")
  spec.required_ruby_version = '>= 2.3.4'

  spec.add_runtime_dependency("http", "~> 3.0")
  spec.add_runtime_dependency("activesupport", ">=3.0")
  spec.add_runtime_dependency("credit_card_validations", "~>3.4")

  spec.add_development_dependency("rspec", "~>3.6")
  spec.add_development_dependency("webmock", "~>3.1")
  # spec.add_development_dependency("pry-byebug", "~>3.5")
end
