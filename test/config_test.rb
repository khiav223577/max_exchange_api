require 'test_helper'

class ConfigTest < Minitest::Test
  def test_default_config
    assert_equal 3, $origin_default_config.timeout
    assert_nil $origin_default_config.logger
  end

  def test_timeout
    assert_equal 15, MaxExchangeApi::PublicApi.new.config.timeout
    assert_equal 12, MaxExchangeApi::PublicApi.new(config: { timeout: 12 }).config.timeout
  end
end
