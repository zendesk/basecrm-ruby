# -*- encoding: utf-8 -*-
require File.expand_path('../lib/base_crm/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Marcin Bunsch"]
  gem.email         = ["marcin@futuresimple.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "base_crm"
  gem.require_paths = ["lib"]
  gem.version       = BaseCrm::VERSION
  gem.add_dependency "api_client"
end
