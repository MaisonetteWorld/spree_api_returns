lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'spree_api_returns/version'

# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_api_returns'
  s.version     = SpreeApiReturns::VERSION
  s.summary     = 'Return API Extension for Spree'
  s.description = 'Return API Extension for Spree: Additional API Endpoints'
  s.required_ruby_version = '>= 2.1.0'

  s.email         = ["pawel@praesens.co"]
  s.authors       = ["Paweł Strzałkowski"]
  s.homepage      = "http://praesens.co/"
  s.license = 'BSD-3'

  s.files       = `git ls-files`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 3.1.3'
  s.add_dependency 'rabl', '~> 0.12.0'
  s.add_dependency 'versioncake', '~> 2.3.1'
end
