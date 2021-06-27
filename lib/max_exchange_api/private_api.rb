# frozen_string_literal: true

require 'max_exchange_api/base_api'

module MaxExchangeApi
  class PrivateApi < BaseApi
    base_uri 'https://max-api.maicoin.com/api/v2'

    def initialize(access_key, secret_key)
      super()

      @access_key = access_key
      @secret_key = secret_key
    end

    def my_trades(market, timestamp: nil, from: nil, to: nil, order_by: 'desc', pagination: true, page: 1, limit: 50,
                  offset: 0)
      send_request(
        :get,
        '/trades/my',
        market: market,
        timestamp: timestamp,
        from: from,
        to: to,
        order_by: order_by,
        pagination: pagination,
        page: page,
        limit: limit,
        offset: offset,
      )
    end

    protected

    def send_request(method, path, query)
      query = query.merge(path: "/api/v2#{path}", nonce: (Time.now.to_f * 1000).to_i)
      return super(method, path, Helper.gen_headers(query, @access_key, @secret_key), query)
    end
  end
end
