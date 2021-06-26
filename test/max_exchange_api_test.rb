require 'test_helper'

class MaxExchangeApiTest < Minitest::Test
  def setup
  end

  def test_that_it_has_a_version_number
    refute_nil ::MaxExchangeApi::VERSION
  end

  def test_default_timeout
    assert_equal 15, MaxExchangeApi.default_config.timeout
  end
end
