# frozen_string_literal: true

module MaxExchangeApi
  module PrivateV3
    module WithdrawApi
      def withdraw_addresses(currency, limit: 50, offset: 0)
        send_request(:get, '/withdraw_addresses', currency: currency, limit: limit, offset: offset)
      end

      def withdraws(currency: nil, state: nil, timestamp: nil, order_by: 'desc', limit: 50)
        send_request(
          :get,
          '/withdrawals',
          currency: currency,
          state: state,
          timestamp: timestamp,
          order: order_by,
          limit: limit,
        )
      end

      def withdraw(uuid:)
        send_request(:get, '/withdrawal', uuid: uuid)
      end

      def create_withdraw!(withdraw_address_uuid, amount)
        send_request(:post, '/withdrawal', withdraw_address_uuid: withdraw_address_uuid, amount: amount)
      end

      def create_twd_withdraw!(amount)
        send_request(:post, '/withdrawal/twd', amount: amount)
      end
    end
  end
end
