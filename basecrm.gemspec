# -*- encoding: utf-8 -*-
require File.expand_path('../lib/base_crm/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Marcin Bunsch"]
  gem.email         = ["marcin@futuresimple.com"]
  gem.description   = %q{Base CRM API Client}
  gem.summary       = %q{Base CRM API Client}
  gem.homepage      = "https://github.com/basecrm/basecrm"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "basecrm"
  gem.require_paths = ["lib"]
  gem.version       = BaseCrm::VERSION
  gem.add_dependency "api_client", '>=0.4.1'
end

