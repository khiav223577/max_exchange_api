require 'simplecov'
SimpleCov.start 'test_frameworks'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'max_exchange_api'

require 'minitest/color'
require 'minitest/autorun'

$origin_default_config = MaxExchangeApi.default_config.clone
MaxExchangeApi.default_config.timeout = 15
