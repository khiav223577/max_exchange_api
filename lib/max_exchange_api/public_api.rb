# frozen_string_literal: true

require 'max_exchange_api/base_api'

module MaxExchangeApi
  class PublicApi < BaseApi
    base_uri 'https://max-api.maicoin.com/api/v2'

    def vip_levels(level = nil)
      if level
        send_request(:get, "/vip_levels/#{level}", {})
      else
        send_request(:get, '/vip_levels', {})
      end
    end

    def currencies
      send_request(:get, '/currencies', {})
    end

    def k(market, limit: 30, period: 1, timestamp: nil)
      send_request(:get, '/k', market: market, limit: limit, period: period, timestamp: timestamp)
    end

    def depth(market, limit: 10, sort_by_price: true)
      send_request(:get, '/depth', market: market, limit: limit, sort_by_price: sort_by_price)
    end

    protected

    def send_request(method, path, query)
      super(method, path, {}, query)
    end
  end
end
