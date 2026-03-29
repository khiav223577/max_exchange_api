# frozen_string_literal: true

require 'max_exchange_api/public_api'

module MaxExchangeApi
  class PublicV3Api < PublicApi
    base_uri 'https://max-api.maicoin.com/api/v3'

    def index_prices
      send_request(:get, '/wallet/m/index_prices', {})
    end

    def index_prices_histories(market, start_time, end_time)
      send_request(
        :get,
        '/wallet/m/historical_index_prices',
        market: market,
        start_time: start_time,
        end_time: end_time,
      )
    end

    def available_loan_amount
      send_request(:get, '/wallet/m/limits', {})
    end

    def loan_interest_rates
      send_request(:get, '/wallet/m/interest_rates', {})
    end

    def markets
      send_request(:get, '/markets', {})
    end

    def currencies
      send_request(:get, '/currencies', {})
    end

    def timestamp
      send_request(:get, '/timestamp', {})
    end

    def k(market, limit: 30, period: 1, timestamp: nil)
      send_request(:get, '/k', market: market, limit: limit, period: period, timestamp: timestamp)
    end

    def depth(market, limit: 10, sort_by_price: true)
      send_request(:get, '/depth', market: market, limit: limit, sort_by_price: sort_by_price)
    end

    def trades(market, timestamp: nil, limit: 50)
      send_request(
        :get,
        '/trades',
        market: market,
        timestamp: timestamp,
        limit: limit,
      )
    end

    def tickers
      send_request(:get, '/tickers', {})
    end

    def ticker(market)
      send_request(:get, '/ticker', market: market)
    end
  end
end
