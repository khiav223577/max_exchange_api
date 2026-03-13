# frozen_string_literal: true

module MaxExchangeApi
  module PrivateV2
    module TransactionApi
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

      def withdrawals(currency, from: nil, to: nil, state: nil, pagination: nil, page: 1, limit: 50, offset: 0)
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

      def internal_transfers(currency: nil, side: 'in', from: nil, to: nil, pagination: nil, page: 1, limit: 50, offset: 0)
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
