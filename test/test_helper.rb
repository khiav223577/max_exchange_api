require 'simplecov'
SimpleCov.start 'test_frameworks'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'max_exchange_api'

require 'minitest/color'
require 'minitest/autorun'
