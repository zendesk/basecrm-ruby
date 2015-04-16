require 'rspec/collection_matchers'
require 'factory_girl'
require 'faker'

require 'basecrm'

module FactoryGirl
  module Strategy
    class Create
      def result(evaluation)
        evaluation.create(evaluation.object)
      end
    end
  end
end

Dir[File.join(__dir__, "/support/**/*.rb")].each { |f| require f }
FactoryGirl.find_definitions

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.expect_with :rspec do |expectations|
    # It makes the `description` and `failure_message` of custom matchers include text for helper methods
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.order = :random

  config.raise_errors_for_deprecations!
end
