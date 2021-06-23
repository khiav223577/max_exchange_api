require 'test_helper'

class PublicApiTest < Minitest::Test
  def setup
  end

  def test_depth_api
    response = MaxExchangeApi::PublicApi.instance.stub(:print_log, nil) do
      MaxExchangeApi::PublicApi.instance.depth('maxtwd', limit: 2)
    end

    assert_instance_of(Hash, response)
    assert_equal(%w[timestamp last_update_version last_update_id asks bids], response.keys)

    assert_instance_of(Array, response['asks'])
    assert_equal(2, response['asks'].size)

    assert_instance_of(Array, response['bids'])
    assert_equal(2, response['bids'].size)
  end
end
