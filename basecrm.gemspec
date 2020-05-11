# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'basecrm/version'

Gem::Specification.new do |spec|
  spec.name          = "basecrm"
  spec.version       = BaseCRM::VERSION
  spec.summary       = "Zendesk Sell Official API V2 library client for ruby"
  spec.description   = "Zendesk Sell Official API V2 library client for ruby"

  spec.authors       = ["Zendesk"]
  spec.email         = ["opensource@zendesk.com"]
  spec.homepage      = "https://github.com/zendesk/basecrm-ruby"
  spec.license       = "Apache License Version 2.0"

  spec.require_paths = ["lib"]

  spec.files = Dir["README.md", "LICENSE",  "lib/**/*"]
  spec.test_files = Dir["spec/**/*"]

  spec.add_dependency "faraday", "~> 0.9", ">= 0.9.0"
  spec.add_dependency "json", "~> 2.0"

  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "rspec-collection_matchers", "~> 1.1"
  spec.add_development_dependency "fuubar", "~> 2.0"
  spec.add_development_dependency "factory_bot", "~> 4.11"
  spec.add_development_dependency "faker", "~> 1.4"
end
