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

    def my_trades_of_order(order_id, use_client_id: false)
      id_params_key = use_client_id ? :client_oid : :id
      send_request(:get, '/trades/my/of_order', id_params_key => order_id)
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

    def withdrawal(withdraw_id)
      send_request(:get, '/withdrawal', uuid: withdraw_id)
    end

    def withdrawals(currency, state, from: nil, to: nil, pagination: nil, page: 1, limit: 50,
                    offset: 0)
      send_request(
        :get,
        '/withdrawals',
        currency: currency,
        from: from,
        to: to,
        state: state,
        pagination: pagination,
        page: page,
        limit: limit,
        offset: offset,
      )
    end

    def create_withdrawal!(currency, withdraw_address_id, amount)
      send_request(:post, '/withdrawal', currency: currency, withdraw_address_uuid: withdraw_address_id, amount: amount)
    end

    protected

    def send_request(method, path, query)
      query = query.merge(path: "/api/v2#{path}", nonce: (Time.now.to_f * 1000).to_i)
      return super(method, path, Helper.gen_headers(query, @access_key, @secret_key), query)
    end
  end
end
