# frozen_string_literal: true

module MaxExchangeApi
  module PrivateV2
    module WithdrawApi
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
    end
  end
end
