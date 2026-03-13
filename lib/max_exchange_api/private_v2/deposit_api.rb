# frozen_string_literal: true

module MaxExchangeApi
  module PrivateV2
    module DepositApi
      def deposits(currency, from: nil, to: nil, state: nil, pagination: nil, page: 1, limit: 50, offset: 0)
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

      def rewards(reward_type: nil, currency: nil, from: nil, to: nil, pagination: nil, page: 1, limit: 50, offset: 0)
        path = reward_type ? "/rewards/#{reward_type}" : '/rewards'
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

      def yields(currency: nil, from: nil, to: nil, pagination: nil, page: 1, limit: 50, offset: 0)
        send_request(
          :get,
          '/yields',
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
    end
  end
end
