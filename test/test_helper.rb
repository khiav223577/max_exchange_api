require 'simplecov'
SimpleCov.start 'test_frameworks'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'max_exchange_api'

require 'minitest/autorun'

module TestHelper
  @origin_default_config = MaxExchangeApi.default_config.clone.freeze

  class << self
    attr_reader :origin_default_config
  end
end

MaxExchangeApi.default_config.timeout = 15
