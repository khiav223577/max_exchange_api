require 'test_helper'

class PublicApiTest < Minitest::Test
  def setup
    @api = MaxExchangeApi::PublicApi.new
  end

  def test_vip_levels_api
    response = @api.stub(:print_log, nil) do
      @api.vip_levels
    end

    assert_instance_of(Array, response)
    assert_equal(10, response.size)

    expected = {
      'level'                  => 0,
      'minimum_trading_volume' => 0,
      'minimum_staking_volume' => 0,
      'maker_fee'              => 0.0005,
      'taker_fee'              => 0.0015,
    }
    assert_equal(expected, response[0])
  end

  def test_vip_levels_api_with_level_params
    response = @api.stub(:print_log, nil) do
      @api.vip_levels(0)
    end

    assert_instance_of(Hash, response)

    expected = {
      'level'                  => 0,
      'minimum_trading_volume' => 0,
      'minimum_staking_volume' => 0,
      'maker_fee'              => 0.0005,
      'taker_fee'              => 0.0015,
    }
    assert_equal(expected, response)
  end

  def test_currencies_api
    response = @api.stub(:print_log, nil) do
      @api.currencies
    end

    assert_instance_of(Array, response)
    assert_equal({ 'id' => 'twd', 'precision' => 0, 'sygna_supported' => false }, response[0])
    assert_equal({ 'id' => 'btc', 'precision' => 8, 'sygna_supported' => true }, response[1])
    assert_equal({ 'id' => 'eth', 'precision' => 8, 'sygna_supported' => true }, response[2])
  end

  def test_k_api
    response = @api.stub(:print_log, nil) do
      @api.k('btctwd', limit: 5)
    end

    assert_instance_of(Array, response)
    assert_equal(5, response.size)
  end

  def test_depth_api
    response = @api.stub(:print_log, nil) do
      @api.depth('maxtwd', limit: 2)
    end

    assert_instance_of(Hash, response)
    assert_equal(%w[timestamp last_update_version last_update_id asks bids], response.keys)

    assert_instance_of(Array, response['asks'])
    assert_equal(2, response['asks'].size)

    assert_instance_of(Array, response['bids'])
    assert_equal(2, response['bids'].size)
  end

  def test_trades_api
    response = @api.stub(:print_log, nil) do
      @api.trades('btctwd', limit: 5)
    end

    assert_instance_of(Array, response)
    assert_equal(5, response.size)
  end
end
