# frozen_string_literal: true

require 'max_exchange_api/base_api'

module MaxExchangeApi
  class PublicApi < BaseApi
    base_uri 'https://max-api.maicoin.com/api/v2'

    def depth(market, limit: 10, sort_by_price: true)
      send_request(:get, '/depth', market: market, limit: limit, sort_by_price: sort_by_price)
    end

    protected

    def send_request(method, path, query)
      super(method, path, {}, query)
    end
  end
end
