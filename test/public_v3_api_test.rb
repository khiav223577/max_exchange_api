require 'test_helper'

class PublicV3ApiTest < Minitest::Test
  def setup
    @api = MaxExchangeApi::PublicV3Api.new
  end

  def test_vip_levels_api
    response = @api.stub(:print_log, nil) do
      @api.available_loan_amount
    end

    assert_instance_of(Hash, response)
    assert_equal(%w[btc eth usdt link doge ltc], response.keys)
  end
end
