require 'simplecov'
SimpleCov.start

require 'webmock/rspec'
require 'pry'
require 'vcr'

require 'som_timer'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    config.mock_with :mocha
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.allow_http_connections_when_no_cassette = true
end
