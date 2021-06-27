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

    def member_profile
      send_request(:get, '/members/profile', {})
    end

    def me
      send_request(:get, '/members/me', {})
    end

    def vip_level
      send_request(:get, '/members/vip_level', {})
    end

    def accounts
      send_request(:get, '/members/accounts', {})
    end

    def account(currency)
      send_request(:get, "/members/accounts/#{currency}", {})
    end

    def deposits(currency, from: nil, to: nil, state: nil, pagination: nil, page: 1, limit: 50,
                 offset: 0)
      send_request(
        :get,
        '/deposits',
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

    def deposit(transaction_id)
      send_request(:get, '/deposit', txid: transaction_id)
    end

    def deposit_addresses(currency: nil, pagination: nil, page: 1, limit: 50, offset: 0)
      send_request(
        :get,
        '/deposit_addresses',
        currency: currency,
        pagination: pagination,
        page: page,
        limit: limit,
        offset: offset,
      )
    end

    def create_deposit_addresses!(currency)
      send_request(:post, '/deposit_addresses', currency: currency)
    end

    def withdraw_addresses(currency, pagination: nil, page: 1, limit: 50, offset: 0)
      send_request(
        :get,
        '/withdraw_addresses',
        currency: currency,
        pagination: pagination,
        page: page,
        limit: limit,
        offset: offset,
      )
    end

    def withdrawal(withdraw_id)
      send_request(:get, '/withdrawal', uuid: withdraw_id)
    end

    def withdrawals(currency, from: nil, to: nil, state: nil, pagination: nil, page: 1, limit: 50,
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

    def internal_transfers(currency: nil, side: 'in', from: nil, to: nil, pagination: nil, page: 1, limit: 50,
                           offset: 0)
      send_request(
        :get,
        '/internal_transfers',
        currency: currency,
        side: side,
        from: from,
        to: to,
        pagination: pagination,
        page: page,
        limit: limit,
        offset: offset,
      )
    end

    def internal_transfer(internal_transfer_id)
      send_request(:get, '/internal_transfer', uuid: internal_transfer_id)
    end

    def rewards(reward_type: nil, currency: nil, from: nil, to: nil, pagination: nil, page: 1, limit: 50, offset: 0)
      path = reward_type ? '/rewards' : "/rewards/#{reward_type}"
      send_request(
        :get,
        path,
        currency: currency,
        from: from,
        to: to,
        pagination: pagination,
        page: page,
        limit: limit,
        offset: offset,
      )
    end

    def max_rewards_yesterday
      send_request(:get, '/max_rewards/yesterday', {})
    end

    def orders(market, state: nil, order_by: 'asc', group_id: nil, pagination: nil, page: 1, limit: 50, offset: 0)
      send_request(
        :get,
        '/orders',
        market: market,
        state: state,
        order_by: order_by,
        group_id: group_id,
        pagination: pagination,
        page: page,
        limit: limit,
        offset: offset,
      )
    end

    def order(order_id, use_client_id: false)
      id_params_key = use_client_id ? :client_oid : :id
      send_request(:get, '/order', id_params_key => order_id)
    end

    def cancel_orders!(market: nil, side: nil, group_id: nil)
      send_request(:post, '/orders/clear', market: market, side: side, group_id: group_id)
    end

    def cancel_order!(order_id, use_client_id: false)
      id_params_key = use_client_id ? :client_oid : :id
      send_request(:post, '/order/delete', id_params_key => order_id)
    end

    protected

    def send_request(method, path, query)
      query = query.compact
      query.merge!(path: "/api/v2#{path}", nonce: (Time.now.to_f * 1000).to_i)
      return super(method, path, Helper.gen_headers(query, @access_key, @secret_key), query)
    end
  end
end
