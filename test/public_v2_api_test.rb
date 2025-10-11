require 'test_helper'

class PublicV2ApiTest < Minitest::Test
  def setup
    @api = MaxExchangeApi::PublicV2Api.new
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
    assert_equal(
      {
        'id'                 => 'twd',
        'precision'          => 0,
        'sygna_supported'    => false,
        'm_wallet_supported' => true,
        'min_borrow_amount'  => '',
      }, response[0])

    assert_equal(
      {
        'id'                 => 'btc',
        'precision'          => 8,
        'sygna_supported'    => false,
        'm_wallet_supported' => true,
        'min_borrow_amount'  => '0.001',
      }, response[1])

    assert_equal(
      {
        'id'                 => 'eth',
        'precision'          => 8,
        'sygna_supported'    => true,
        'm_wallet_supported' => true,
        'min_borrow_amount'  => '0.01',
      }, response[2])
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

  def test_markets_api
    response = @api.stub(:print_log, nil) do
      @api.markets
    end

    assert_instance_of(Array, response)

    expected1 = {
      'id'                   => 'maxtwd',
      'name'                 => 'MAX/TWD',
      'market_status'        => 'active',
      'base_unit'            => 'max',
      'base_unit_precision'  => 2,
      'min_base_amount'      => 25.0,
      'quote_unit'           => 'twd',
      'quote_unit_precision' => 4,
      'min_quote_amount'     => 250.0,
      'm_wallet_supported'   => false,
    }
    assert_equal(expected1, response[0])

    expected2 = {
      'id'                   => 'btctwd',
      'name'                 => 'BTC/TWD',
      'market_status'        => 'active',
      'base_unit'            => 'btc',
      'base_unit_precision'  => 8,
      'min_base_amount'      => 0.00008,
      'quote_unit'           => 'twd',
      'quote_unit_precision' => 1,
      'min_quote_amount'     => 250.0,
      'm_wallet_supported'   => true,
    }
    assert_equal(expected2, response[1])
  end

  def test_summary_api
    response = @api.stub(:print_log, nil) do
      @api.summary
    end

    assert_instance_of(Hash, response)
    assert_instance_of(Hash, response['tickers'])
    assert_equal(%w[at buy buy_vol high last low open sell sell_vol volume volume_in_btc volume_in_quote], response['tickers']['btcusdt'].keys.sort)
    assert_equal(%w[at buy buy_vol high last low open sell sell_vol volume volume_in_btc volume_in_quote], response['tickers']['maxtwd'].keys.sort)
  end

  def test_tickers_api
    response = @api.stub(:print_log, nil) do
      @api.tickers
    end

    assert_instance_of(Hash, response)
    assert_equal(%w[at buy buy_vol sell sell_vol open low high last vol vol_in_btc vol_in_quote], response['btcusdt'].keys)
    assert_equal(%w[at buy buy_vol sell sell_vol open low high last vol vol_in_btc vol_in_quote], response['maxtwd'].keys)
  end

  def test_tickers_api_with_parameters
    response = @api.stub(:print_log, nil) do
      @api.tickers('btctwd')
    end

    assert_instance_of(Hash, response)
    assert_equal(%w[at buy buy_vol sell sell_vol open low high last vol vol_in_btc vol_in_quote], response.keys)
  end

  def test_timestamp_api
    response = @api.stub(:print_log, nil) do
      @api.timestamp
    end

    assert_instance_of(123.class, response)
    assert_operator response, :>, 1624704308
  end
end
