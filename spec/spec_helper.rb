# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper.rb"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

require "base_crm"
require "simplecov"
require "rspec/its"

SimpleCov.start do
  add_filter '/spec'
end

RSpec.configure do |config|
end

Dir.glob("#{File.dirname(__FILE__)}/support/*.rb").each { |f| require f }

