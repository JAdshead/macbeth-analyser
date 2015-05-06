require 'webmock/rspec'
require_relative './support/xml'

RSpec.configure do |config|
  config.include WebMock

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end

WebMock.disable_net_connect!
